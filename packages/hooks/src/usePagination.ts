import { ref, computed } from 'vue'

export function usePagination(initialPerPage = 20) {
  const page = ref(1)
  const perPage = ref(initialPerPage)
  const total = ref(0)

  const totalPages = computed(() => Math.ceil(total.value / perPage.value))
  const hasNextPage = computed(() => page.value < totalPages.value)
  const hasPrevPage = computed(() => page.value > 1)

  function nextPage() {
    if (hasNextPage.value) page.value++
  }

  function prevPage() {
    if (hasPrevPage.value) page.value--
  }

  function goToPage(n: number) {
    page.value = Math.max(1, Math.min(n, totalPages.value))
  }

  function setTotal(n: number) {
    total.value = n
  }

  return { page, perPage, total, totalPages, hasNextPage, hasPrevPage, nextPage, prevPage, goToPage, setTotal }
}
