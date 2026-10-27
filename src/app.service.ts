import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { lastValueFrom } from 'rxjs';
import axios, { type AxiosResponse } from 'axios';

@Injectable()
export class AppService {
  constructor(private readonly httpService: HttpService) {}

  getHello(): string {
    return 'Hello World!';
  }

  async httpservice(url: string): Promise<any> {
    // GET-запрос
    const response = await lastValueFrom(this.httpService.get(url));
    return response.data;
  }

  async axios(url: string): Promise<any> {
    // GET-запрос
    const response: AxiosResponse<{ id: string; name: string }> =
      await axios.get(url, {
        timeout: 5000,
        headers: {
          Authorization: 'Bearer token',
        },
      });
    return response.data;
  }
}
