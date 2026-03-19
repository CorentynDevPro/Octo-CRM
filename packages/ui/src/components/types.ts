export type ButtonVariant = 'primary' | 'secondary' | 'outline' | 'ghost' | 'danger'
export type ButtonSize = 'xs' | 'sm' | 'md' | 'lg'
export type BadgeVariant = 'default' | 'success' | 'warning' | 'danger' | 'info'
export type InputSize = 'sm' | 'md' | 'lg'
export type TableAlign = 'left' | 'center' | 'right'

export interface TableColumn<T = unknown> {
  key: string
  label: string
  align?: TableAlign
  sortable?: boolean
  render?: (row: T) => string
}
