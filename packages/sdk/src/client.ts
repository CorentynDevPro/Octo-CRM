import { ofetch, type FetchOptions } from 'ofetch'
import type { ApiResponse } from '@octo-crm/types'

export interface SdkConfig {
  baseURL: string
  getToken?: () => string | null
  onUnauthorized?: () => void
}

export class OctoCrmClient {
  private readonly config: SdkConfig

  constructor(config: SdkConfig) {
    this.config = config
  }

  async request<T>(path: string, options: FetchOptions = {}): Promise<ApiResponse<T>> {
    const token = this.config.getToken?.()
    return ofetch<ApiResponse<T>>(path, {
      baseURL: this.config.baseURL,
      ...options,
      headers: {
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
        ...(options.headers as Record<string, string> ?? {}),
      },
      onResponseError: ({ response }) => {
        if (response.status === 401) {
          this.config.onUnauthorized?.()
        }
      },
    })
  }

  get<T>(path: string, query?: Record<string, unknown>): Promise<ApiResponse<T>> {
    return this.request<T>(path, { method: 'GET', query })
  }

  post<T>(path: string, body?: unknown): Promise<ApiResponse<T>> {
    return this.request<T>(path, { method: 'POST', body })
  }

  put<T>(path: string, body?: unknown): Promise<ApiResponse<T>> {
    return this.request<T>(path, { method: 'PUT', body })
  }

  patch<T>(path: string, body?: unknown): Promise<ApiResponse<T>> {
    return this.request<T>(path, { method: 'PATCH', body })
  }

  delete<T>(path: string): Promise<ApiResponse<T>> {
    return this.request<T>(path, { method: 'DELETE' })
  }
}
