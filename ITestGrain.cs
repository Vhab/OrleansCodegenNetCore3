using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Orleans;

namespace OrleansCodegenNetCore3
{
    public interface ITestGrain : IGrainWithGuidKey
    {
        Task TestAsync();
    }
}
