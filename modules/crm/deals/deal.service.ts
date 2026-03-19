import type { Deal } from './deal.entity'

export interface IDealService {
  getById(id: string, orgId: string): Promise<Deal>
  moveToStage(dealId: string, stageId: string, orgId: string): Promise<Deal>
  close(dealId: string, won: boolean, reason?: string): Promise<Deal>
}
