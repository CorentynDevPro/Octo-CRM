import type { AuthContext } from '../guards/auth.guard'

export type PolicyAction = 'create' | 'read' | 'update' | 'delete'

export interface PolicyRule {
  resource: string
  action: PolicyAction
  condition?: (ctx: AuthContext, resource: unknown) => boolean
}

export class PolicyEngine {
  private rules: PolicyRule[] = []

  addRule(rule: PolicyRule): this {
    this.rules.push(rule)
    return this
  }

  can(ctx: AuthContext, resource: string, action: PolicyAction, data?: unknown): boolean {
    const permKey = `${resource}:${action}`
    if (!ctx.permissions.includes(permKey)) return false
    const rule = this.rules.find((r) => r.resource === resource && r.action === action)
    if (rule?.condition) return rule.condition(ctx, data)
    return true
  }
}
