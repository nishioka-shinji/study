module CONST
  PLACE = {
    HOME: {
      LATITUDE:             35.000000,
      LATITUDE_TOLERANCE:   0.0003,
      LONGTITUDE:           135.000000,
      LONGTITUDE_TOLERANCE: 0.0003,
    },
    COMPANY: {
      LATITUDE:             38.000000,
      LATITUDE_TOLERANCE:   0.0003,
      LONGTITUDE:           97.000000,
      LONGTITUDE_TOLERANCE: 0.0003,
    }
  }.freeze.each_value(&:freeze)
  LINE_CONFIG = {
    CHANNEL_SECRET: "<channel secret>",
    CHANNEL_TOKEN:  "<channel access token>"
    USER_ID:        "<to>"
  }.freeze
end