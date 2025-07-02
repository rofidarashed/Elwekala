import 'package:dio/dio.dart';
import 'package:el_wekala/feature/auth/model/response_model.dart';

class AuthData {
  static final Dio dio = Dio();
  static register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "password": password,
          "profileImage":
              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJEAmQMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABwIDBAUGCAH/xABBEAABAwMABQgGBwcFAQAAAAABAAIDBAURBhIhMaEHEyJBUXGBkRQyQmGx0RVSYnKSosEzU1SCsuHwIyRDRMIl/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAMCAQT/xAAiEQADAAIBBAIDAAAAAAAAAAAAAQIDETETITJBBFESIoH/2gAMAwEAAhEDEQA/AJxREQBERAEVueaOnidLM4NY3eT1KmmqoKppdTytkAODjqXNrejunrZeREXTgREQBERAERUGWMPDC9ocdzSdqArREQBERAEREAREQBERAavSV2raZB9ZzRxVjRNuKGZ3bLjgF90rOLdGO2YfAq7oyzVtLDjGs9x44/RebnP/AAvxh/ptURF6SAREQBERAFx+kA5q8ueN/RcP88F2C5PSxmK9jup0OPIn5rz/ACl+my/x/PR1iKiB2vDG/wCs0Hgq16CAREQBERAEREARF8JA3nCA5TTKp1aqmizsDC7HvJ/strork2WJx9pzyO7WOFz+ncbJa2ndG5znCMhwa4bNuz9VtaG4st1sp6WnifKY2AFzzjavL+czlqmz0fjVY0kjokWjtd5lnq3R1hhjYW5YR0do6tp/zC23pVP+/i/GF6ItWtojcOHpl5FbE8J3Sx/iCqEjDue0+K0ZKkRaetvTqaufA2APYzAzrYOcLF3MLdG4irepNwuT0vkLa+Fp2t5rIHvyfktzDeqd46bJGHuyFz+mzY6ltPU08+duo5oG3rI/VSzVN43plMU1FraOi0elM1lpXuO3Uxv7DhbFafRKMxaP0oL9YkE5xjrOxbhWnxRGuWEVLntb6zgO8q0aylacGphB98gWjhfRYj7nRM31DPDb8FR9L0H8QPwu+S5tAtSUEcY/1bjVtH2p8LFkZRDZ6RVTfz7FFVfymHWIt1vLj+9qpNv4R81zlw000grsh1wdAw+xTNEYHiOlxUt2/WiuoXvZM9xqbXRR85WPhpo/rTz4zxC5Wv080bowWU4lrXD91Fsz952OGVEkj3SyGSVznyO3vcck95VK709+TOdTXCJSh0xo7nQzVM/M0kjQ4MhMocSBuO4bSo+rr9d7iMVtxqJGkYLA7Uaf5W4C1yLkYphti8tUkiYuTmpZV6PUDpg1/okphfrbg0HZ+RwUkfRtH/DsUI8kNwa+uudqe4Fr42zMb2kHVfwLPJTjb5TPRxSOOXauHH7Q2HiExrVUjtvcplBtlEf+u3iqTaaE76cfiPzWairols1/0Nb/ANx+d3zUQ8q9XzLaClgc5gfI+bouIIDdjf6j5KaKx+pSyu+yQPFefOU2r9I0pkhaejSwsix7z0j/AFDyU6W7SKy9QzVUWk18odUU9zqNVu5sjucH5srrdGtMK+81hobmynLBGZGyMYWnII2HbjrKjtfQSNxI7kvFNLRyMlSyXxp3bLVUSW2r9LZqf8sQywg7eo56+xbSi0l0euD2mK6wPJ3RzyGMnwdgqC0XFi0tJnXl2+6PSMDqAAO9Da5p9pkpKzI6i0bnU7Gffiz815ppKuqoXa1FUzU5zn/RkLM+S3dJpvpBTbDWNqG/VqIw7iMHimsi4aYTxvlaPRNOaCQ4pvRy7sZq5WRqN+qPJcBonLNdoLVV1MbY5ZyJSGZwAMuHmAPNSCu4rdp7RzLChrTPJSLLu1EbbdayhIx6PM6Me9oPRPiMHxWIqEwiIgCsVM2oNVvrHgvtROIxhu13wWCSScnaUB0GgNwFs0wtk7nasb5eYk94eNX4lp8F6Ys78CaE+y4OHcf7g+a8j5cNrHFrhta4dR7V6h0UubblR224t3VlOC4dhIyfIghYrtSZSe8tHUIiKhMwrq7EDWfWdwXmS9Vn0heK6szkTzve0/Zz0eGF6B06uH0fZa6pB6UFM8s++RhvHC84gYAA3BTXemzb7SkERFswERUvlYz1nAe5AVKpjHSyMiZ68jgxnvcTgcSsN9X1Mb4lbrk/pHXPTS2Rv6TYpDO7PUGAuH5g1G9LZ1Lb0egtHKNlPNHHGBqU1OIwOzcBwBXRrW2VmI5pD7T9UdwHzJWyWMS1CN5XumefeVag9F0kZVNbhlZAHH3vb0Tw1FximLlktvOWZtUxvSo6gE/cfs+Jb5KHUjjRy+dhWJ6gM6LNrvgqJ6n2Yz3uWKtmASScnaUREAU08jtydPotJS5zLQVJ1Bn2XHXb4Z1h4KHKKkqrhLzVBSz1UmcasEbnkd+BsUqclejt+slfV1Fxo/RqSogDS18g1y5py3ojPUXb+1Tyv9SmPyJuY4PaHNOWuGQe0L6sKzyc5Qsb1xksx2Y3cMLLkeI43PO5oJKontbMNaeiMeWS4NhsL4C8A1VUyPGepvS+LR5qFzNGPbHgpH5X7fd7lLbjRUNTU00DJHSOhZr9Nxb1DbuHZ1qKZo5KeTm6iOSGT6krS13kVPG9rZvItPRluqoxuyfBW3Vbj6rQO/asZFQmVumkdvcVQiIApI5EqESXe5V7m/sKdsTT73uyf6B5qN1NfI9Qc1oi+Ygh1fVux3DEY8MgnxWMnibx+RKttZqUMIO9zdY952/qslBsGAiouxhnO6Z20XK11VLs/wBzTujHudjonzx5Ly7LNI/ovaWY2FnYewr1xdWa1I5wG1hDlGLeTSwTXOpras1U4nmdLzHO6jGlxJIGrg429qi7UU9+yql3K0QgNrmsG1ztjWjee5dDatCNJbrquprTPHGf+SpHMt/NtPgCp6tNmtNobq2y301N2ujjAce87ytnrrjzfR3pfZEdq5HKh4a68XaOLtjpGax/G7H9K7C18m2i1uALqD0x/W6sdzmf5fV4LrNdUOepvI2bWNFEcUNNEIqeKOKNu5kbQ0DwCsyvVUkiw5phkNBy47mjaSoVReJNpo9P/uJ4CfWAeB3bD/5WfeZeaoH7cF5DR/ndlaazUlaLjDUcw9kIzrOf0dhHZv34WXpQ6Xm6drI3uZrFznNaSBjdnzK9E1SwPaI1MvMtMwoXq9LBT1UfN1MMUzD7MjA4eRWup52nc4HuWbHIvNFl7g0tdyf6K14OvaIYXHrpiYeDSAubuHI5bpNY2261UDjubOxsrR5ap4qRWvVwPXoWR/Z53jRB9w5JtI6Yk0j6KtYN2pIY3HwcMfmXMXDRi/20ZrbPWxtG9wiL2j+ZuRxXpfXVJet9ZmekeUi9oDto6O/3L0zoPbzQWizULvWgpmulH2tXpfmcvtztVruQ/wDoW+kqffNC1x4hbmxt155pcbGgMB79p/RFkV0kOn+Etm4REXoIFMjBJG5jtzgQVyTZCxxY7Y5pwQuvXPV1lqprjNJA6JsLzrZc45zjbsx25Xm+RFUk5PR8e5ltUY7ZVUZg0EkgAdZKzoLAxuDUVD3kdTBqg/E8VsIKCkgIMUDA4bnHpEeJ2rE4L99jdZo9GljE022GJ8gO4gbD4nYsiO2VUn7R8cQ/EfLZ8Vu0VlglckXmr0a6Oz042zOklPvdgcMcVmwwQwDEETIx9loCuIqKUuETdN8sIiLRwszUlPOczQRvPa5oJ81iPs1Kf2Zli+6/Pxytiiy5l8o0qa4Zp32mduTFOx/Y17S3jt+CsPpayP1oC4dZYQR8+C36LDwwzazUcvJNzRAlBjJ3B7S3PmqXTDtXUkAjBGQViS2uhl9amYPezoHhhSr479MpOde0c1JMt/o+zVtweRgyvc4/AcAFjVGjkDweZqJoz1A4cB+vFbemhbT08ULCS2NgaCevATBiqKboZss1KUlxEReo8wREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAf/9k=",
        },
      );
      print(response.data);
      print(response.statusMessage);
      var data = response.data;
      var model = ResponseModel.fromJson(data);
      return model;
    } on DioException catch (e) {
      if (e.response != null) {
        var error = e.response!.data;
        var errorModel = ResponseModel.fromJson(error);
        return errorModel;
      }
    }
  }
}
