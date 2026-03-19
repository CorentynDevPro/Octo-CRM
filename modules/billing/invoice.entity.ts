import type { BaseEntity } from '@octo-crm/types'
import { InvoiceStatus } from '@octo-crm/types'

export interface Invoice extends BaseEntity {
  organizationId: string
  customerId: string
  dealId: string | null
  invoiceNumber: string
  status: InvoiceStatus
  issueDate: Date
  dueDate: Date
  paidAt: Date | null
  subtotal: number
  taxAmount: number
  discountAmount: number
  total: number
  currency: string
  notes: string | null
  terms: string | null
  createdById: string
}
