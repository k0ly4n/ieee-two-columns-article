# Обзор

В этом каталоге находится пример статьи, выполенной в стиле двухколоночного документа.
Такой формат характерен для многих вариантов IEEE Transactions.

Для работы с этим шаблоном необходимо установить язык программирования [R](https://cran.r-project.org/bin/windows) и среду [RStudio](https://www.rstudio.com/products/rstudio/download/preview/).
Также рекомендуется наличие [Markdown](http://daringfireball.net/projects/markdown)-редактора - например, [ReText](https://github.com/retext-project/retext) или [Typora](https://typora.io).

Полный список файлов и каталогов представлен в таблице ниже:

| Имя  | Назначение и содержание |
| --------- | ----------------------- |
| `/img` | Папка для иллюстраций |
| `10pt.eqp` | Файл с настройками форматирования формул MathType |
| `article.bib` | Список библиографических ссылок в формате [BibTeX](https://ru.wikipedia.org/wiki/BibTeX) |
| `article.Rproj` | Файл проекта для RStudio |
| `_bookdown.yml` | Настройки для bookdown документа в формате YAML (имя выходного файла, подписи рисунков, таблиц и листингов) |
| `filter.lua` | Файл Lua-фильтра для Pandoc, служит для автоматического редактирования docx документа в соответствии с шаблоном IEEE |
| `gost-r-7-0-5-2008-numeric.csl` | Файл CSL-стиля для  формирования списка литературы по ГОСТ |
| `header.docx` | Файл с оформленной шапкой статьи (название и имена авторов) и нижним колонтитулом |
| `ieee.csl` | Файл CSL-стиля для формирования списка литературы в стиле IEEE |
| `index.Rmd` | Основной документ, содержит настройки в формате YAML (в том числе название статьи) и тело статьи |
| `Inforino_formatting_EN.docx` | Шаблон документа MS Word со стилями оформления |

**Примечание**: после клонирования этого репозитория и запуска компиляции документа в программе RStudio с помощью кнопки *Build All* в списке файлов появятся следующие элементы:

* файл `article.html` - книга в виде единого HTML-документа (соответствует формату  `bookdown::html_document2`);
* папка `_book` со следующими файлами:
  * `article.docx` - книга в формате docx (Microsoft Word) с учетом файла-шаблона *Inforino_formatting_EN.docx*.

# Использование шаблона

Подготовку статьи следует выполнять в следующем порядке:

1. Задать название статьи в поле `title` файла `index.Rmd`.
2. Написать текст статьи в файле `index.Rmd` с использованием Markdown и его расширений ([RMarkdown Cheat Sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf) и [bookdown](https://bookdown.org/home/getting-started.html)).
3. Преобразовать документ в HTML-формат кнопкой *Build Book* → `bookdown::html_document2` для проверки правильности нумерации рисунков, таблиц, формул и ссылок на них.
4. Преобразовать документ в docx-формат  кнопкой *Build Book* → `bookdown::docx_document2`.

После получения финальной версии docx-документа следует:

1. Преобразовать все формулы в MathType: 

	1. На ленте *MathType* нажать кнопку *Convert Equations*;
  в открывшемся окне установить в области *Equation types to convert* галочку *Word 2007 and late (OMML) equations*, затем в области *Convert equations to* выбрать *MathType equations (OLE objects)*.  
	1. Нажать кнопку *Convert* и ждать результата.
	1. Отформатировать все формулы (греческие буквы - прямо и т.п.) - нажать на ленте *MathType* кнопку *Format Equations*, в области *Format equations using preferences from* установить переключатель в положение *MathType preference file*, нажать кнопку *Browse*, выбрать файл настроек `10pt.eqp` и применить изменения кнопкой *OK*.

	> **Примечание:** При конвертации из OMML в MathType могут не работать LaTeX-окружения `split` и `multiline`, поэтому надежнее использовать `array`.
	
    В результате ко всем формулам будет применен стиль *MTDisplayEquation*, сами формулы будут расположены в центре колонки, а их номера будут выравнены табуляцией по правому краю.

2. Применить стиль *table head* для подписей таблиц. В шапке таблиц применить стиль *table*, а обычных ячейках - *table copy*. Выровнять таблицы по центру колонки.
3. Скопировать файл `header.docx` в папку `_book`. Скопировать в него содержимое файла `article.docx` и заполнить в нем название, информацию об авторах и нижний колонтитул.
4. Убрать красные строки в абзацах, начинающихся со строчной буквы или логически связанных знаками препинания с формулами.
5. При необходимости переместить все рисунки в углы страницы. Проверить и изменить их номера в случае необходимости.
6. Применить стиль *references* ко всем элементам списка литературы, удалив существующие номера в квадратных скобках.
