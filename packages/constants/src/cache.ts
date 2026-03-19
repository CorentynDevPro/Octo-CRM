export const CACHE_TTL = {
  SHORT: 60,          // 1 minute
  MEDIUM: 300,        // 5 minutes
  LONG: 3600,         // 1 hour
  DAY: 86400,         // 24 hours
  WEEK: 604800,       // 7 days
} as const

export const CACHE_KEYS = {
  USER: (id: string) => `user:${id}`,
  USER_PERMISSIONS: (id: string) => `user:permissions:${id}`,
  ORG: (id: string) => `org:${id}`,
  PIPELINE: (id: string) => `pipeline:${id}`,
  STAGES: (pipelineId: string) => `pipeline:${pipelineId}:stages`,
  ROLES: 'roles:all',
} as const
