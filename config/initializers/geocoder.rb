Geocoder.configure(

    # street address geocoding service (default :nominatim)
    lookup: :google,
    use_https: true,
    # to use an API key:
    api_key: "AIzaSyBBfPcX2dcr-jIU4nwB4FufbcUinQImXvg",

    # geocoding service request timeout, in seconds (default 3):
    timeout: 5,

    # set default units to kilometers:
    units: :km
)
