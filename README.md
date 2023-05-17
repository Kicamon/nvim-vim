# My neovim profile

## 使用之前
使用的插件管理器：[vim-plug](https://github.com/junegunn/vim-plug)
如果是arch linux，运行命令`sudo pacman -S neovim-plug`

python支持`pip install neovim`


使用前先根据使用的操作系统进行安装

插件环境要求（一定要先安装这些环境）：
- nodejs >= 14.14.0
- python >= 3.10.0
- yarn
- npm
- clang（cpp格式化&代码提示）
- jedi-language-server（python LSP）
- autopep8（python格式化）

coc.nvim插件使用注意：
进入`./plugged/coc.nvim`文件，运行命令`yarn install`

## 通用功能
#### 超出屏幕自动换行
|     操作    |    快捷键    |
|:-----------:|:------------:|
|  :set wrap  |    Ctrl+w    |
| :set nowrap | Ctrl+Shift+w |

#### 复制粘贴
|     操作     |    快捷键    |
|:------------:|:------------:|
| 复制到剪切板 |  Ctrl+Insert |
|     粘贴     | Shift+Insert |

#### 切换Buffers
|  操作  | 快捷键 |
|:------:|:------:|
| 上一个 |   [b   |
| 下一个 |   ]b   |

#### 打开和关闭文件树
| 操作 | 快捷键 |
|:----:|:------:|
| 打开 | \<F12> |
| 关闭 | \<F12> |

#### num-key
> 这个功能是方便进行上下移动的，可以不用伸手去摸数字键就能实现多行上下移动的操作。这里我只配置了400行以内的上下移动，又需要的朋友可以参照写法自行拓展

这里简单的给几个例子就能理解

| 操作 |     命令     |
|:----:|:------------:|
|  8j  |  \<leader>k' |
|  10j | \<leader>a;' |
|  45j | \<leader>f;' |
|  50k | \<leader>g;[ |

非常容易理解，将数字键映射到了中间的一行，这样在上下进行多行移动的时候就不用伸出手指去够上边的数字键了。具体的配置在`num-key`文件夹中

## 编程
> 我的配置只写了cpp，当然，大家可以自行围绕自己所使用的编程语言进行配置

#### 一键编译等
|    操作    | 快捷键 |
|:----------:|:------:|
|  编译运行  |  \<F5> |
| 自动格式化 | Ctrl+i |

##### cpp/c
我所使用的是Microsoft的码风，如果想要换成Google的码风的话，找到这两行
```Vim Script
let g:formatdef_clangformat_microsoft = '"clang-format -style microsoft -"'
let g:formatters_cpp = ['clangformat_microsoft' ]
let g:formatters_c = ['clangformat_microsoft' ]
```

换成：
```Vim Script
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_cpp = ['clangformat_google']
let g:formatters_c = ['clangformat_google']
```

##### python
```shell
pip3 install autopep8
```


#### 代码模板
代码模板使用的是`coc-snippets` 这个插件，比如我想要存储一个cpp的基本模板，按照下面步骤操作：
1. 打开一个cpp文件
2. 运行命令：`:CocCommand snippets.editSnippets`
3. 在文件的末尾加上：

```snippets
snippet acm "template" b
/*
[[ ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ]],
[[ ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ]],
[[ ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ]],
[[ ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ]],
[[ ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ]],
[[ ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ]],
[[ ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ]],
[[ ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ]],
[[ ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ]],
[[ ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
[[ ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ]],
[[ ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ]],
[[ ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ]],
[[ ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ]],
*/
// #pragma GCC optimize(2)
#include <bits/stdc++.h>
using namespace std;
#define endl '\n'
#define all(a) a.begin(), a.end()
#define rall(a) a.rbegin(), a.rend()
#define ll long long
#define Debug(x) cout << #x << ':' << x << endl

signed main()
{
	ios::sync_with_stdio(false);
	cin.tie(0);

	// clock_t start, finish;
	// start = clock();

	${0}

	// finish = clock();
	// cout <<endl<<"the time cost is:" << double(finish - start) / CLOCKS_PER_SEC<<endl;

	return 0;
}
endsnippet
```

之后在写代码的过程中输入`acm` 就会出现基本模板的代码补全

## Markdown
#### 指定浏览器
使用下列命令在配置文件中指定浏览器，不写的话就是调用默认浏览器

我这里使用的是chromium浏览器

```Vim Script
let g:mkdp_browser='chromium'
```



#### 输入法切换
> 当前文件是.md时，进入插入模式时会自动将输入法切换成中文（使用fcitx5）,详细配置查看fctix.vim文件

#### 预览等操作
|    操作    | 快捷键 |
|:----------:|:------:|
|    预览    |  \<F5> |
| 表格格式化 |  Alt+e |
|  插入目录  |  :TOC  |

#### 语法快捷键
具体内容查看本目录下`md-snippets`文件

|    语法   | 快捷键 |
|:---------:|:------:|
|   `****`  |   ,b   |
|   `~~~~`  |   ,s   |
|    `**`   |   ,i   |
|    ````   |   ,d   |
|    ```    |   ,c   |
|  `- [ ]`  |   ,m   |
| `\!\[]()` |   ,p   |
|  `\[]()`  |   ,a   |
|    `#`    |   ,1   |
|    `##`   |   ,2   |
|   `###`   |   ,3   |
|   `####`  |   ,4   |

输入`,f`可以跳出来，自己尝试一下就知道了

------

参考：
1. https://github.com/theniceboy/nvim
2. https://blog.liukairui.me/article/Vim%E9%85%8D%E7%BD%AE%E7%AC%94%E8%AE%B0(%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE,%E6%8F%92%E4%BB%B6%E6%8E%A8%E8%8D%90,%E7%BE%8E%E5%8C%96)(C++,Python,MarkDown,R...)/
