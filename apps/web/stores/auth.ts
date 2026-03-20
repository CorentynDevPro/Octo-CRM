import { defineStore } from "pinia";
import { ref, computed } from "vue";

export const useAuthStore = defineStore("auth", () => {
  const token = ref<string | null>(null);
  const refreshToken = ref<string | null>(null);
  const user = ref<{
    id: string;
    email: string;
    name: string;
    role: string;
  } | null>(null);

  const isAuthenticated = computed(() => !!token.value);

  function setTokens(access: string, refresh: string) {
    token.value = access;
    refreshToken.value = refresh;
  }

  function setUser(u: typeof user.value) {
    user.value = u;
  }

  function logout() {
    token.value = null;
    refreshToken.value = null;
    user.value = null;
  }

  return {
    token,
    refreshToken,
    user,
    isAuthenticated,
    setTokens,
    setUser,
    logout,
  };
});
