import { Controller, Get } from '@nestjs/common';

@Controller()
export class AppController {
  @Get()
  hello() {
    return { ok: true, service: 'cashquest-api', time: new Date().toISOString() };
  }
}
