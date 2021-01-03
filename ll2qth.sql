CREATE OR REPLACE FUNCTION ll2qth(lat numeric, lon numeric, prec integer = 6)
    RETURNS varchar(8)
    AS $$
/* The Maidenhead locator system, referred to by amateur radio operators as a
 * 'QTH locator', is a geographic coordinate system which can succinctly
 * describe any location on Earth using a short sequence of letters and numbers.
 * 
 * Longitude is encoded first, then latitude.
 * 
 * To avoid negative numbers in the encoding, longitude is measured from the
 * antimeridian of Greenwich, and latitude is measured from the South Pole to the
 * North Pole.  This gives the Prime Meridian a false easting of 180 degrees, and
 * the equator a false northing of 90 degrees.
 * 
 * The first and second characters, called the Field, are encoded by the letters A
 * through R (base 18), each representing 20 degrees of longitude and 10 degrees
 * of latitude, respectively.  The Earth is thus divided into 324 (18^2) Fields.
 * 
 * The third and fourth characters, called the Square, are encoded by the numbers
 * 0 through 9 (base 10), each representing 2 degrees of longitude and 1 degree of
 * latitude, respectively.  Each Field is thus divided into 100 (10^2) Squares.
 * 
 * The fifth and sixth characters, called the Subsquare, are encoded by the
 * letters a through x (base 24), each representing 5 minutes of longitude and 2.5
 * minutes of latitude, respectively. Each Square is thus subdivided into 576
 * (24^2) Subsquares.
 * 
 * The seventh and eighth characters, called the Extended square, are encoded by
 * the numbers 0 through 9 (base 10), each representing 30 seconds longitude and
 * 15 seconds of latitude, respectively. Each Subsquare is thus divided into 100
 * (10^2) Extended squares.
 * 
 * While there is no formally defined method for encoding values beyond extended
 * square precision, it is common to repeatedly apply the subsquare (base 24) and
 * square (base 10) encoding rules until the desired level of precision is
 * reached.
 * 
 * As an example, the headquarters of the ARRL in Newington, CT, located at:
 * 
 *   41º 42' 52.86" N, 72º 43' 42.70" W
 * 
 *   or:
 * 
 *   41.714683, -72.728527
 * 
 * Encodes to extended square precision thusly:
 * 
 *             +- Field
 *             | +- Square
 *  longitude  | | +- Subsquare
 *             | | | +- Extended square
 *             v v v v
 *             FN31pr21
 *              ^ ^ ^ ^
 *              | | | + Extended square
 *  latitude    | | + Subsquare
 *              | + Square
 *              + Field
 */
    DECLARE
        ASCII_0 integer := 48;
        ASCII_A integer := 97;

        qth varchar(8);
    BEGIN
        -- 180 degree false easting
        lon := lon + 180.0;

        -- 90 degree false northing
        lat := lat + 90.0;

        -- Field
        lon := lon / 20;
        lat := lat / 10;
        qth := UPPER(CHR(ASCII_A + FLOOR(lon)::integer)) || UPPER(CHR(ASCII_A + FLOOR(lat)::integer));

        -- Square
        lon := 10 * (lon - FLOOR(lon));
        lat := 10 * (lat - FLOOR(lat));
        qth := qth || CHR(ASCII_0 + FLOOR(lon)::integer) || CHR(ASCII_0 + FLOOR(lat)::integer);

        -- Subsquare
        lon := 24 * (lon - FLOOR(lon));
        lat := 24 * (lat - FLOOR(lat));
        qth := qth || CHR(ASCII_A + FLOOR(lon)::integer) || CHR(ASCII_A + FLOOR(lat)::integer);

        -- Extended square
        lon := 10 * (lon - FLOOR(lon));
        lat := 10 * (lat - FLOOR(lat));
        qth := qth || CHR(ASCII_0 + FLOOR(lon)::integer) || CHR(ASCII_0 + FLOOR(lat)::integer);

        -- Return QTH with desired level of precision
        RETURN SUBSTRING(qth FOR prec);
    END
$$
    LANGUAGE 'plpgsql' IMMUTABLE PARALLEL SAFE;
