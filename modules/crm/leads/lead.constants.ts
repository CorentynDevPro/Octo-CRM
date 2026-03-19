export const LEAD_SOURCES = [
  'website',
  'referral',
  'cold_call',
  'email_campaign',
  'social_media',
  'trade_show',
  'partner',
  'other',
] as const

export const LEAD_SCORE_THRESHOLDS = {
  COLD: 0,
  WARM: 40,
  HOT:  70,
  QUALIFIED: 85,
} as const

export const LEAD_CACHE_TTL = 300 // seconds
