import { ref } from 'vue'
import type { LeadEntity } from '@octo-crm/types'

export function useLeads() {
  const leads   = ref<LeadEntity[]>([])
  const loading = ref(false)
  const error   = ref<string | null>(null)

  async function fetchLeads(query?: Record<string, unknown>) {
    loading.value = true
    error.value   = null
    try {
      // TODO: inject SDK client via plugin
      // const response = await sdk.leads.list(query)
      // leads.value = response.data?.data ?? []
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to load leads'
    } finally {
      loading.value = false
    }
  }

  return { leads, loading, error, fetchLeads }
}
