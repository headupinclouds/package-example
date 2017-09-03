#ifndef FOO_BAZ_HPP_
#define FOO_BAZ_HPP_

#include <iostream> // std::cout
#include <baz_export.h> // BAZ_EXPORT

#include <spdlog/spdlog.h>
#include <mutex>

namespace foo {

class Logger
{
public:
    using Pointer = std::shared_ptr<spdlog::logger>;
    static Pointer create(const char* name);
    static Pointer get(const char* name);
    static void drop(const char* name);
    static int count();
    static int increment();

protected:
    static std::mutex m_mutex;
    static int m_count;
};

class BAZ_EXPORT Baz {
 public:
  static void say() {
#if (FOO_BAZ_DEBUG)
    const char* m = "Baz.hpp (Debug)";
#else
    const char* m = "Baz.hpp (Not debug)";
#endif
    std::cout << m << std::endl;
    cpp_say();
  }

 private:
  static void cpp_say();
};

} // namespace foo

#endif // FOO_BAZ_HPP_
