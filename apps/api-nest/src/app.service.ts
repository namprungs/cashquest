import { Injectable } from "@nestjs/common";
@Injectable()
export class AppService {
  getHello() {
    return {
      ok: true,
      service: "cashquest-api",
      time: new Date().toISOString(),
    };
  }
}
