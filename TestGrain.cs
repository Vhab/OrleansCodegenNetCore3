using System.Threading.Tasks;
using Orleans;

namespace OrleansCodegenNetCore3
{
    public class TestGrain : Grain, ITestGrain
    {
        public Task TestAsync()
        {
            return Task.CompletedTask;
        }
    }
}