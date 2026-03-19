import type { OctoCrmClient } from '../client'
import type { LoginDto, RegisterDto, TokenResponseDto } from '@octo-crm/types'
import type { ApiResponse } from '@octo-crm/types'

export class AuthResource {
  constructor(private readonly client: OctoCrmClient) {}

  login(data: LoginDto): Promise<ApiResponse<TokenResponseDto>> {
    return this.client.post('/auth/login', data)
  }

  register(data: RegisterDto): Promise<ApiResponse<TokenResponseDto>> {
    return this.client.post('/auth/register', data)
  }

  logout(): Promise<ApiResponse<void>> {
    return this.client.post('/auth/logout')
  }

  refresh(refreshToken: string): Promise<ApiResponse<TokenResponseDto>> {
    return this.client.post('/auth/refresh', { refreshToken })
  }

  me(): Promise<ApiResponse<unknown>> {
    return this.client.get('/auth/me')
  }
}
