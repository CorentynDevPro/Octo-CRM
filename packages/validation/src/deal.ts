import { z } from 'zod'

export const CreateDealSchema = z.object({
  title: z.string().min(1).max(255),
  value: z.number().min(0),
  currency: z.string().length(3).default('USD'),
  stageId: z.string().uuid(),
  pipelineId: z.string().uuid(),
  contactId: z.string().uuid().optional(),
  expectedCloseDate: z.string().datetime().optional(),
  probability: z.number().min(0).max(100).optional(),
})

export const UpdateDealSchema = CreateDealSchema.partial()

export type CreateDealInput = z.infer<typeof CreateDealSchema>
export type UpdateDealInput = z.infer<typeof UpdateDealSchema>
