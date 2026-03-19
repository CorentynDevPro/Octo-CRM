import type { BaseEntity } from '@octo-crm/types'

export interface Inventory {
  id: string
  organizationId: string
  productId: string
  warehouseId: string
  quantity: number
  reserved: number
  reorderPoint: number
  updatedAt: Date
}

export interface InventoryMovement extends BaseEntity {
  organizationId: string
  productId: string
  warehouseId: string
  movementType: 'IN' | 'OUT' | 'ADJUSTMENT' | 'TRANSFER'
  quantity: number
  referenceType: string | null
  referenceId: string | null
  notes: string | null
  createdById: string
}
