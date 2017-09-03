#include <foo/Bar.hpp>
#include <cstdlib> // EXIT_SUCCESS
#include <iostream> // std::cout

#include <spdlog/spdlog.h>

static std::shared_ptr<spdlog::logger> createLogger(const char *name)
{
    std::vector<spdlog::sink_ptr> sinks;
    sinks.push_back(std::make_shared<spdlog::sinks::stdout_sink_mt>());
#if defined(__ANDROID__)
    sinks.push_back(std::make_shared<spdlog::sinks::android_sink>());
#endif
    auto logger = std::make_shared<spdlog::logger>(name, begin(sinks), end(sinks));
    spdlog::register_logger(logger);
    spdlog::set_pattern("[%H:%M:%S.%e | thread:%t | %n | %l]: %v");
    return logger;
}

int main() {

    auto logger = createLogger("boo_logger");
    logger->info("Hello from boo");
    
    std::cout << "Hello, Boo!" << std::endl;
    foo::Bar::say();
    return EXIT_SUCCESS;
}
