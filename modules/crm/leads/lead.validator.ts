import { z } from 'zod'

export const LeadSchema = z.object({
  firstName: z.string().min(1).max(100),
  lastName:  z.string().min(1).max(100),
  email:     z.string().email().optional(),
  phone:     z.string().optional(),
  company:   z.string().max(255).optional(),
  jobTitle:  z.string().max(255).optional(),
  source:    z.string().optional(),
  ownerId:   z.string().uuid().optional(),
})

export const UpdateLeadSchema = LeadSchema.partial().extend({
  score:        z.number().int().min(0).max(100).optional(),
  status:       z.string().optional(),
  customFields: z.record(z.unknown()).optional(),
})

export type LeadSchemaType       = z.infer<typeof LeadSchema>
export type UpdateLeadSchemaType = z.infer<typeof UpdateLeadSchema>
