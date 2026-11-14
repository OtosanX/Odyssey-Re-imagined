declare namespace Server {
  export interface Config {
    game: {
      accounts: {
        file: string,
      }
    },
    server: {
      host?: string,
      webEnabled?: boolean,
      adminEnabled?: boolean,
      adminPort: number,
      dataFolder: string,
      interval: number,
      log: {
        level: string,
        file: string
      },
      port: number
    },
    scripts: {
      directory: string
    }
  }
}
