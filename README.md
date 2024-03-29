# 我现在使用lua来配置nvim
这是我的[配置文件](https://github.com/Kicamon/nvim)

# My neovim profile

## 使用之前
使用前先根据使用的操作系统进行安装

插件环境要求（一定要先安装这些环境）：
- nodejs >= 14.14.0
- python >= 3.10.0
- yarn
- npm
- clang（cpp格式化&代码提示）
- pyright（python LSP）
- autopep8（python格式化）
- js-beautify(js，css，html格式化)
- lua(lua插件)

如果是arch系linux用户的话，直接运行usr文件夹里的install.sh即可自动安装好所有要求的环境
`source ~/.config/nvim/usr/install.sh`



使用的插件管理器：[vim-plug](https://github.com/junegunn/vim-plug)

python支持`pip install neovim`

coc.nvim插件使用注意：
进入`./plugged/coc.nvim`文件，运行命令`yarn install`

## 通用功能
#### 超出屏幕自动换行
|    操作    |       作用       |
|------------|------------------|
| \<space>sw | 切换换行与不换行 |


#### 切换Buffers
|  操作  | 快捷键 |
|--------|--------|
| 上一个 |   [b   |
| 下一个 |   ]b   |

#### 切换页面
| 操作   | 快捷键 |
|--------|--------|
| 上一个 | tp     |
| 下一个 | tn     |
| 前移   | tmp    |
| 后移   | tmn    |

#### 打开和关闭文件树
| 操作 | 快捷键 |
|------|--------|
| 打开 | \<F12> |
| 关闭 | \<F12> |

#### cursor
> 这个功能是方便进行上下移动的，可以不用伸手去摸数字键就能实现多行上下移动的操作。这里我只配置了400行以内的上下移动，又需要的朋友可以参照写法自行拓展

这里简单的给几个例子就能理解

| 操作 |     命令     |
|------|--------------|
|  8j  |  'k\<leader> |
|  10j | 'a;\<leader> |
|  45j | 'f;\<leader> |
|  50k | [g;\<leader> |

非常容易理解，将数字键映射到了中间的一行，这样在上下进行多行移动的时候就不用伸出手指去够上边的数字键了。具体的配置在`cursor.vim`文件中

## 编程
> 大家可以参考配置文件自行围绕自己所使用的编程语言进行配置

#### 一键编译等
| 操作        | 快捷键       |
| ----------- | -------------|
| 编译运行    | \<F5>        |
| 自动格式化  | \<leader>af  |

#### 一键注释与解注释

| 操作   | 快捷键 |
|--------|--------|
| 注释   | Ctrl+/ |
| 解注释 | Ctrl+/ |

##### 自动格式化
```Vim
call autoformat#config('cpp', 
    \ ['clang-format -style microsoft -']) 
call autoformat#config('c', 
    \ ['clang-format -style microsoft -']) 
call autoformat#config('python', 
    \ ['autopep8 -'])
call autoformat#config('html', 
    \ ['html-beautify -s 2'])
autocmd! BufWritePre * :Autoformat
nnoremap <C-i> :call AutoFormat()<CR>:w<CR>
inoremap <C-i> <ESC>:call AutoFormat()<CR>:w<CR>
func! AutoFormat()
    if &filetype == "markdown"
        :TableModeEnable
    else
        :Autoformat
    endif
endfunction
```

如果想要改变格式化的风格，只需要更改特定语言的中括号内的参数即可

##### c/cpp
```shell
sudo pacman -S clang
```

##### python
```shell
pip3 install autopep8
```

#### 查看全局变量、函数及类等
快捷键`\n`


![Navbuddy](./usr/pictures/navbuddy.gif)

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

#### acm
在打算法竞赛的时候，可以使用命令来配合浏览器插件`competitive companion`来进行操作

| shortcut | action                                            |
| -------- | ------------------------------------------------- |
| ri       | 获取测试样例<br>（配合competitive companion使用） |
| ra       | 手动添加样例                                      |
| re       | 修改样例                                          |
| rr       | 运行代码                                          |
| rd       | 选择删除样例                                      |
| rm       | 删除所有样例和可执行文件                          |

## Markdown
#### 指定浏览器
使用下列命令在配置文件中指定浏览器，不写的话就是调用默认浏览器

我这里使用的是chromium浏览器

```Vim
let g:mkdp_browser='chromium'
```

#### 输入法切换
> 当前文件是.md或者.txt时，进入插入模式时会自动将输入法切换成中文（使用fcitx5）,详细配置查看tool.vim文件

#### 预览等操作
|    操作    | 快捷键 |
|------------|--------|
|    预览    |  \<F5> |
| 表格格式化 |  Alt+e |
|  插入目录  |   toc  |

#### 语法快捷键
具体内容查看本目录下`md-snippets`文件

|      语法 | 快捷键 |
|-----------|--------|
|    `****` |     ,b |
|    `~~~~` |     ,s |
|      `**` |     ,i |
|      ```` |     ,d |
|       ``` |     ,c |
|   `- [ ]` |     ,m |
| `\!\[]()` |     ,p |
|   `\[]()` |     ,a |
|       `#` |     ,1 |
|      `##` |     ,2 |
|     `###` |     ,3 |
|    `####` |     ,4 |

输入`,f`可以跳出来，自己尝试一下就知道了

------

参考：
1. https://github.com/theniceboy/nvim
2. https://blog.liukairui.me/article/Vim%E9%85%8D%E7%BD%AE%E7%AC%94%E8%AE%B0(%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE,%E6%8F%92%E4%BB%B6%E6%8E%A8%E8%8D%90,%E7%BE%8E%E5%8C%96)(C++,Python,MarkDown,R...)/
