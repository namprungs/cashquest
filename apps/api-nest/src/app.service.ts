import { Injectable } from '@nestjs/common';
import { HelloResponse } from '@shared-types/index';
@Injectable()
export class AppService {
  getHello(): HelloResponse {
    return { ok: true, service: 'cashquest-api', time: new Date().toISOString()};
  }
}
