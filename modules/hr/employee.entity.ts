import type { BaseEntity } from '@octo-crm/types'

export interface Employee extends BaseEntity {
  userId: string
  organizationId: string
  departmentId: string | null
  employeeNumber: string | null
  jobTitle: string | null
  hireDate: Date
  endDate: Date | null
  employmentType: 'FULL_TIME' | 'PART_TIME' | 'CONTRACTOR' | 'INTERN'
  managerId: string | null
  salary: number | null
  salaryCurrency: string
  address: Record<string, unknown>
  emergencyContact: Record<string, unknown>
}
