export const CACHE_TTL = {
  SHORT: 60,
  MEDIUM: 5 * 60,
  LONG: 60 * 60,
  DAY: 24 * 60 * 60,
  WEEK: 7 * 24 * 60 * 60,
} as const

export const CACHE_KEYS = {
  USER: (id: string) => `user:${id}`,
  USER_PERMISSIONS: (id: string) => `user:permissions:${id}`,
  ORG: (id: string) => `org:${id}`,
  PIPELINE: (id: string) => `pipeline:${id}`,
  STAGES: (pipelineId: string) => `pipeline:${pipelineId}:stages`,
  ROLES: 'roles:all',
} as const
