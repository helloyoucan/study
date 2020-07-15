declare module '*.css';
declare module '*.less';
declare module "*.png";
declare module '*.svg' {
  export function ReactComponent(props: React.SVGProps<SVGSVGElement>): React.ReactElement
  const url: string
  export default url
}
interface Android {
  todo(data: any): void
}
interface Window {
  android: Android,
  onNativeMessage(message: any): void
}