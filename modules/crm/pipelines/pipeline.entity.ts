import type { BaseEntity } from '@octo-crm/types'

export interface Pipeline extends BaseEntity {
  organizationId: string
  name: string
  isDefault: boolean
}

export interface Stage extends BaseEntity {
  pipelineId: string
  name: string
  order: number
  probability: number
  color: string | null
}
