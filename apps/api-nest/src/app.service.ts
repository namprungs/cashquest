import { Injectable } from '@nestjs/common';
import { HelloResponse } from '@cashquest/shared-types';
@Injectable()
export class AppService {
  getHello(): HelloResponse {
    return { ok: true, service: 'cashquest-api', time: new Date().toISOString()};
  }
}
