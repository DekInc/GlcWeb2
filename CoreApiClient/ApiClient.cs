﻿using ComModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CoreApiClient
{
    public partial class ApiClient
    {
        private readonly HttpClient _httpClient;
        private Uri BaseEndpoint { get; set; }
        private CancellationTokenSource Cts { set; get; }
        public ApiClient(Uri baseEndpoint, bool LongPlay)
        {
            BaseEndpoint = baseEndpoint ?? throw new ArgumentNullException("baseEndpoint");
            _httpClient = new HttpClient {
                Timeout = (LongPlay ? TimeSpan.FromMinutes(10) : TimeSpan.FromMinutes(4))
            };
            //Cts = new CancellationTokenSource(LongPlay ? new TimeSpan(0, 10, 0) : new TimeSpan(0, 4, 0));            
        }
        private async Task<T> GetAsync<T>(Uri requestUrl)
        {
            var response = await _httpClient.GetAsync(requestUrl, HttpCompletionOption.ResponseHeadersRead);
            response.EnsureSuccessStatusCode();
            var data = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(data);
        }
        private async Task<string> GetAsyncNoJson<T>(Uri requestUrl)
        {
            var response = await _httpClient.GetAsync(requestUrl, HttpCompletionOption.ResponseHeadersRead);
            response.EnsureSuccessStatusCode();
            string data = await response.Content.ReadAsStringAsync();
            return data;
        }
        private async Task<string> PostAsyncJson<T>(Uri requestUrl, string JsonParams)
        {
            var StringContent = new StringContent(JsonParams, Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(requestUrl, StringContent);
            response.EnsureSuccessStatusCode();
            string data = await response.Content.ReadAsStringAsync();
            return data;
        }
        private async Task<T> PostGetAsyncJson<T>(Uri requestUrl, string JsonParams)
        {
            var StringContent = new StringContent(JsonParams, Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(requestUrl, StringContent);
            response.EnsureSuccessStatusCode();
            string data = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(data);
        }

        //private async Task<Message<T>> PostAsync<T>(Uri requestUrl, T content)
        //{
        //    var response = await _httpClient.PostAsync(requestUrl.ToString(), CreateHttpContent<T>(content));
        //    response.EnsureSuccessStatusCode();
        //    var data = await response.Content.ReadAsStringAsync();
        //    return JsonConvert.DeserializeObject<Message<T>>(data);
        //}
        //private async Task<Message<T1>> PostAsync<T1, T2>(Uri requestUrl, T2 content)
        //{
        //    var response = await _httpClient.PostAsync(requestUrl.ToString(), CreateHttpContent<T2>(content));
        //    response.EnsureSuccessStatusCode();
        //    var data = await response.Content.ReadAsStringAsync();
        //    return JsonConvert.DeserializeObject<Message<T1>>(data);
        //}
        private Uri CreateRequestUri(string relativePath, string queryString = "")
        {
            var endpoint = new Uri(BaseEndpoint, relativePath);
            UriBuilder uriBuilder = new UriBuilder(endpoint) {
                Query = queryString
            };
            return uriBuilder.Uri;
        }
        private HttpContent CreateHttpContent<T>(T content)
        {
            var json = JsonConvert.SerializeObject(content, MicrosoftDateFormatSettings);
            return new StringContent(json, Encoding.UTF8, "application/json");
        }
        private static JsonSerializerSettings MicrosoftDateFormatSettings {
            get {
                return new JsonSerializerSettings
                {
                    DateFormatHandling = DateFormatHandling.MicrosoftDateFormat
                };
            }
        }
    }
}
