import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('httpservice_lets')
  httpservice_lets() {
    return this.appService.httpservice(
      'https://take-lets-office.novotelecom.ru',
    );
  }
  @Get('httpservice_nuc')
  httpservice_nuc() {
    return this.appService.httpservice(
      'https://take-nuc-office.novotelecom.ru',
    );
  }

  @Get('axios_lets')
  axios_lets() {
    return this.appService.axios('https://take-lets-office.novotelecom.ru');
  }
  @Get('axios_nuc')
  axios_nuc() {
    return this.appService.axios('https://take-nuc-office.novotelecom.ru');
  }
}
