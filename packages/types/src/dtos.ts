import { UserRole } from './enums'

// ── User DTOs ──────────────────────────────────────────────────
export interface CreateUserDto {
  email: string
  firstName: string
  lastName: string
  password: string
  role?: UserRole
  organizationId: string
}

export interface UpdateUserDto {
  firstName?: string
  lastName?: string
  phone?: string
  avatarUrl?: string
  role?: UserRole
}

// ── Lead DTOs ──────────────────────────────────────────────────
export interface CreateLeadDto {
  firstName: string
  lastName: string
  email: string
  phone?: string
  company?: string
  source?: string
  ownerId?: string
}

export interface UpdateLeadDto {
  firstName?: string
  lastName?: string
  email?: string
  phone?: string
  company?: string
  source?: string
  ownerId?: string
  score?: number
}

// ── Deal DTOs ──────────────────────────────────────────────────
export interface CreateDealDto {
  title: string
  value: number
  currency?: string
  stageId: string
  pipelineId: string
  contactId?: string
  expectedCloseDate?: string
  probability?: number
}

export interface UpdateDealDto {
  title?: string
  value?: number
  stageId?: string
  probability?: number
  expectedCloseDate?: string
}

// ── Auth DTOs ──────────────────────────────────────────────────
export interface LoginDto {
  email: string
  password: string
}

export interface RegisterDto {
  email: string
  password: string
  firstName: string
  lastName: string
  organizationName: string
}

export interface TokenResponseDto {
  accessToken: string
  refreshToken: string
  expiresIn: number
}
