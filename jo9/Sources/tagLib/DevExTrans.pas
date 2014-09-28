unit DevExTrans;

(*********************************************************************************
Перевод сообщений на русский язык библиотек от Developer Express:
  ExpressBars Suite 5,
  ExpressLibrary,
  ExpressDataController,
  ExpressEditors Library 5,
  ExpressExport Library,
  ExpressPageControl 2,
  ExpressQuantumGrid 5.
  
Сделано на основе компонентов с http://www.FreeDevExpressAddons.com

Для использования в раздел INITIALIZATION главной формы программы
нужно добавить вызов DevExTranslate(), а в раздел USES добавить модуль DevExTrans.
Можно, конечно, вызывать DevExTranslate() и при старте программы.

В данной реализации используется стандартная функция cxSetResourceString.
**********************************************************************************)

interface

uses
  cxClasses,
  cxLibraryStrs,          // cxLibrary
//  cxPCConsts,             // PageControl2
  cxGridStrs,             // QuantumGrid5
  cxEditConsts,           // Editors5
  cxDataConsts,           // Datacontroller
  cxFilterConsts,         // Filter
  cxFilterControlStrs,    // Filter in Editors5
  cxGridPopupMenuConsts,  // GridPopupMenu
  cxExportStrs,           // GridExport
  cxNavigator,            // cxNavigator
  dxBarStrs;              // dxBars5
  
procedure DevExTranslate;

implementation

procedure DevExTranslate;
begin
  //cxLibrary
  cxSetResourceString(@scxCantCreateRegistryKey, 'Не можу створити ключ у реєстрі: \%s'); // Can't create the registry key: \%s
  cxSetResourceString(@scxInvalidPropertyElement, 'Invalid property element: %s'); // Invalid property element: %s
  cxSetResourceString(@scxConverterCantCreateStyleRepository, 'Не можу створити Style Repository'); // Can't create the Style Repository
  //PageControl2
{  cxSetResourceString(@scxPCImageListIndexError, 'Индекс (%d) должен быть между 0 и %d'); // Index (%d) must be between 0 and %d
  cxSetResourceString(@scxPCNoBaseImages, 'BaseImages is not assigned'); // BaseImages is not assigned
  cxSetResourceString(@scxPCNoRegisteredStyles, 'Нет зарегистрированных стилей'); // There are no styles registered
  cxSetResourceString(@scxPCPageIndexError, '%d - неверное значение PageIndex.  PageIndex должен быть между 0 и %d'); // %d is an invalid PageIndex value.  PageIndex must be between 0 and %d
  cxSetResourceString(@scxPCPainterClassError, 'PCPainterClass is nil'); // PCPainterClass is nil
  cxSetResourceString(@scxPCStandardStyleError, 'Неподдерживаемый стандартный стиль %s'); // %s is an unsupported standard style
  cxSetResourceString(@scxPCStyleNameError, 'Незарегистрированное наименование стиля %s'); // %s is an unregistered style name
  cxSetResourceString(@scxPCTabCountEqualsZero, 'Tabs.Count = 0'); // Tabs.Count = 0
  cxSetResourceString(@scxPCTabIndexError, 'Индекс Tab (%d) вне границ'); // Tab's index (%d) out of bounds
  cxSetResourceString(@scxPCTabVisibleIndexOutsOfBounds, 'TabVisibleIndex (%d) must be between 0 and %d'); // TabVisibleIndex (%d) must be between 0 and %d
  cxSetResourceString(@scxPCVisibleTabListEmpty, 'Нет видимых закладок'); // There are no visible tabs
  cxSetResourceString(@scxPCAllowRotateError, 'Стиль %s не поддерживает поворот закладок'); // %s style does not support rotation of tabs}
  //QuantumGrid5
  cxSetResourceString(@scxGridRecursiveLevels, 'Ви не можете створювати рекурсивні уровні'); // You cannot create recursive levels
  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Підтвердити'); // Confirm
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Видалити запис?'); // Delete record?
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Видалити цсі обрані записи?'); // Delete all selected records?
//  cxSetResourceString(@scxGridNoDataInfoText, '<нет данных для отображения>'); // <No data to display>
  cxSetResourceString(@scxGridNewItemRowInfoText, 'Натисніть для вставки строки'); // Click here to add a new row
  cxSetResourceString(@scxGridFilterIsEmpty, '<фільтр порожній>'); // <Filter is Empty>
  cxSetResourceString(@scxGridCustomizationFormCaption, 'Налаштувати'); // Customization
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Стовбці'); // Columns
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Перетягніть стовбець сюди для групування'); // Drag a column header here to group by that column
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Налаштувати...'); // Customize...
//  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'Нажмите для выбора видимых столбцов'); // Click here to select visible columns
  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Секції'); // Bands
//  cxSetResourceString(@scxGridBandsQuickCustomizationHint, 'Нажмите для выбора видимых секций'); // Click here to select visible bands
//  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Строки'); // Rows
  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Пропущений проміжний компонент!'#13#10'Пожалуйста добавте компонент %s на форму.'); // Missing an intermediary component! Please add a %s component to the form.
  cxSetResourceString(@scxGridConverterNotExistGrid, 'Не існує cxGrid'); // cxGrid does not exist
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Компонент не існує'); // Component does not exist
  cxSetResourceString(@scxImportErrorCaption, 'Помилка імпорту'); // Import error
  cxSetResourceString(@scxNotExistGridView, 'Вид таблиці (GridLevel) не існує'); // Grid view does not exist
  cxSetResourceString(@scxNotExistGridLevel, 'Активний рівень (Active GridLevel) не існує'); // Active grid level does not exist
  cxSetResourceString(@scxCantCreateExportOutputFile, 'Не можу створити файл для експорту'); // Can't create the export output file
  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control'); // ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control
//  cxSetResourceString(@scxGridChartValueHintFormat, '''%s'' для ''%s'': ''%s''');  // '%s for %s is %s' - series display text, category, value
  //Editors5
//  cxSetResourceString(@cxSEditDateConvertError, 'Невозможно преобразовать в дату'); // Could not convert to date
  cxSetResourceString(@cxSEditInvalidRepositoryItem, 'Элемент из репозитария неприемлем'); // The repository item is not acceptable
  cxSetResourceString(@cxSEditNumericValueConvertError, 'Невозможно преобразовать в числовое значение'); // Could not convert to numeric value
  cxSetResourceString(@cxSEditPopupCircularReferencingError, 'Циклическая ссылка невозможна'); // Circular referencing is not allowed
  cxSetResourceString(@cxSEditPostError, 'Произошла ошибка при применении значения'); // An error occured during posting edit value
  cxSetResourceString(@cxSEditTimeConvertError, 'Невозможно преобразовать в формат времени'); // Could not convert to time
  cxSetResourceString(@cxSEditValidateErrorText, 'Неверное значение. Используйте клавишу Esc для отмены изменений'); // Invalid input value. Use escape key to abandon changes
  cxSetResourceString(@cxSEditValueOutOfBounds, 'Значение за пределами диапазона'); // Value out of bounds
  // TODO
  cxSetResourceString(@cxSEditCheckBoxChecked, 'True'); // True
  cxSetResourceString(@cxSEditCheckBoxGrayed, ''); //
  cxSetResourceString(@cxSEditCheckBoxUnchecked, 'False'); // False
  cxSetResourceString(@cxSRadioGroupDefaultCaption, ''); //
  cxSetResourceString(@cxSTextTrue, 'True'); // True
  cxSetResourceString(@cxSTextFalse, 'False'); // False
  // blob
  cxSetResourceString(@cxSBlobButtonOK, '&OK'); // &OK
  cxSetResourceString(@cxSBlobButtonCancel, '&Отмена'); // &Cancel
  cxSetResourceString(@cxSBlobButtonClose, '&Закрыть'); // &Close
  cxSetResourceString(@cxSBlobMemo, '(MEMO)'); // (MEMO)
  cxSetResourceString(@cxSBlobMemoEmpty, '(memo)'); // (memo)
  cxSetResourceString(@cxSBlobPicture, '(ИЗОБРАЖЕНИЕ)'); // (PICTURE)
  cxSetResourceString(@cxSBlobPictureEmpty, '(изображение)'); // (picture)
  // popup menu items
  cxSetResourceString(@cxSMenuItemCaptionCut, 'Вы&резать'); // Cu&t
  cxSetResourceString(@cxSMenuItemCaptionCopy, '&Копировать'); // &Copy
  cxSetResourceString(@cxSMenuItemCaptionPaste, '&Вставить'); // &Paste
  cxSetResourceString(@cxSMenuItemCaptionDelete, '&Удалить'); // &Delete
  cxSetResourceString(@cxSMenuItemCaptionLoad, '&Загрузить...'); // &Load...
  cxSetResourceString(@cxSMenuItemCaptionSave, 'Сохранить &Как...'); // Save &As...
  // date
  cxSetResourceString(@cxSDatePopupClear, 'Очистить'); // Clear
//  cxSetResourceString(@cxSDatePopupNow, 'Сейчас'); // Now
//  cxSetResourceString(@cxSDatePopupOK, 'OK'); // OK
  cxSetResourceString(@cxSDatePopupToday, 'Сегодня'); // Today
  cxSetResourceString(@cxSDateError, 'Неверная Дата'); // Invalid Date
  // smart input consts
  cxSetResourceString(@cxSDateToday, 'сьогодні'); // today
  cxSetResourceString(@cxSDateYesterday, 'вчора'); // yesterday
  cxSetResourceString(@cxSDateTomorrow, 'завтра'); // tomorrow
  cxSetResourceString(@cxSDateSunday, 'Воскресіння'); // Sunday
  cxSetResourceString(@cxSDateMonday, 'Понеділок'); // Monday
  cxSetResourceString(@cxSDateTuesday, 'Вівторок'); // Tuesday
  cxSetResourceString(@cxSDateWednesday, 'Середа'); // Wednesday
  cxSetResourceString(@cxSDateThursday, 'Четвер'); // Thursday
  cxSetResourceString(@cxSDateFriday, 'П''ятниця'); // Friday
  cxSetResourceString(@cxSDateSaturday, 'Субота'); // Saturday
  cxSetResourceString(@cxSDateFirst, 'перший'); // first
  cxSetResourceString(@cxSDateSecond, 'другий'); // second
  cxSetResourceString(@cxSDateThird, 'третій'); // third
  cxSetResourceString(@cxSDateFourth, 'четвертий'); // fourth
  cxSetResourceString(@cxSDateFifth, 'п''ятий'); // fifth
  cxSetResourceString(@cxSDateSixth, 'шостий'); // sixth
  cxSetResourceString(@cxSDateSeventh, 'сьомий'); // seventh
  cxSetResourceString(@cxSDateBOM, 'МісНач'); // bom
  cxSetResourceString(@cxSDateEOM, 'МісКон'); // eom
  cxSetResourceString(@cxSDateNow, 'зараз'); // now
  // calculator
  cxSetResourceString(@scxSCalcError, 'Error'); // Error
  // HyperLink
//  cxSetResourceString(@scxSHyperLinkPrefix, 'http://'); // http://
//  cxSetResourceString(@scxSHyperLinkDoubleSlash, '//'); // //
  // edit repository
  cxSetResourceString(@scxSEditRepositoryBlobItem, 'BlobEdit|Represents the BLOB editor'); // BlobEdit|Represents the BLOB editor
  cxSetResourceString(@scxSEditRepositoryButtonItem, 'ButtonEdit|Represents an edit control with embedded buttons'); // ButtonEdit|Represents an edit control with embedded buttons
  cxSetResourceString(@scxSEditRepositoryCalcItem, 'CalcEdit|Represents an edit control with a dropdown calculator window'); // CalcEdit|Represents an edit control with a dropdown calculator window
  cxSetResourceString(@scxSEditRepositoryCheckBoxItem, 'CheckBox|Represents a check box control that allows selecting an option'); // CheckBox|Represents a check box control that allows selecting an option
  cxSetResourceString(@scxSEditRepositoryComboBoxItem, 'ComboBox|Represents the combo box editor'); // ComboBox|Represents the combo box editor
  cxSetResourceString(@scxSEditRepositoryCurrencyItem, 'CurrencyEdit|Represents an editor enabling editing currency data'); // CurrencyEdit|Represents an editor enabling editing currency data
  cxSetResourceString(@scxSEditRepositoryDateItem, 'DateEdit|Represents an edit control with a dropdown calendar'); // DateEdit|Represents an edit control with a dropdown calendar
  cxSetResourceString(@scxSEditRepositoryHyperLinkItem , 'HyperLink|Represents a text editor with hyperlink functionality'); // HyperLink|Represents a text editor with hyperlink functionality
  cxSetResourceString(@scxSEditRepositoryImageComboBoxItem, 'ImageComboBox|Represents an editor displaying the list of images and text strings within the dropdown window'); // ImageComboBox|Represents an editor displaying the list of images and text strings within the dropdown window
  cxSetResourceString(@scxSEditRepositoryImageItem, 'Image|Represents an image editor'); // Image|Represents an image editor
  cxSetResourceString(@scxSEditRepositoryLookupComboBoxItem, 'LookupComboBox|Represents a lookup combo box control'); // LookupComboBox|Represents a lookup combo box control
  cxSetResourceString(@scxSEditRepositoryMaskItem, 'MaskEdit|Represents a generic masked edit control.'); // MaskEdit|Represents a generic masked edit control.
  cxSetResourceString(@scxSEditRepositoryMemoItem, 'Memo|Represents an edit control that allows editing memo data'); // Memo|Represents an edit control that allows editing memo data
  cxSetResourceString(@scxSEditRepositoryMRUItem , 'MRUEdit|Represents a text editor displaying the list of most recently used items (MRU) within a dropdown window'); // MRUEdit|Represents a text editor displaying the list of most recently used items (MRU) within a dropdown window
  cxSetResourceString(@scxSEditRepositoryPopupItem, 'PopupEdit|Represents an edit control with a dropdown list'); // PopupEdit|Represents an edit control with a dropdown list
  cxSetResourceString(@scxSEditRepositorySpinItem, 'SpinEdit|Represents a spin editor'); // SpinEdit|Represents a spin editor
  cxSetResourceString(@scxSEditRepositoryRadioGroupItem, 'RadioGroup|Represents a group of radio buttons'); // RadioGroup|Represents a group of radio buttons
  cxSetResourceString(@scxSEditRepositoryTextItem, 'TextEdit|Represents a single line text editor'); // TextEdit|Represents a single line text editor
  cxSetResourceString(@scxSEditRepositoryTimeItem, 'TimeEdit|Represents an editor displaying time values'); // TimeEdit|Represents an editor displaying time values
  //
  cxSetResourceString(@scxRegExprLine, 'Строка'); // Line
  cxSetResourceString(@scxRegExprChar, 'Символ'); // Char
  cxSetResourceString(@scxRegExprNotAssignedSourceStream, 'Не присвоен поток-источник'); // The source stream is not assigned
  cxSetResourceString(@scxRegExprEmptySourceStream, 'Поток-источник пуст'); // The source stream is empty
  cxSetResourceString(@scxRegExprCantUsePlusQuantifier, 'Квантификатор ''+'' не может быть применен здесь'); // The '+' quantifier cannot be applied here
  cxSetResourceString(@scxRegExprCantUseStarQuantifier, 'Квантификатор ''*'' не может быть применен здесь'); // The '*' quantifier cannot be applied here
  cxSetResourceString(@scxRegExprCantCreateEmptyAlt, 'The alternative should not be empty'); // The alternative should not be empty
  cxSetResourceString(@scxRegExprCantCreateEmptyBlock, 'Блок не должен быть пуст'); // The block should not be empty
  cxSetResourceString(@scxRegExprIllegalSymbol, 'Неверно: ''%s'''); // Illegal '%s'
  cxSetResourceString(@scxRegExprIllegalQuantifier, 'Неверный квантификатор: ''%s'''); // Illegal quantifier '%s'
  cxSetResourceString(@scxRegExprNotSupportQuantifier, 'The parameter quantifiers are not supported'); // The parameter quantifiers are not supported
  cxSetResourceString(@scxRegExprIllegalIntegerValue, 'Неверное целое значение'); // Illegal integer value
  cxSetResourceString(@scxRegExprTooBigReferenceNumber, 'Число-Ссылка слишком велико'); // Too big reference number
  cxSetResourceString(@scxRegExprCantCreateEmptyEnum, 'Не могу создать пустое перечисление'); // Can't create empty enumeration
  cxSetResourceString(@scxRegExprSubrangeOrder, 'Начальный символ поддиапазона должен быть меньше конечного'); // The starting character of the subrange must be less than the finishing one
  cxSetResourceString(@scxRegExprHexNumberExpected0, 'Ожидается шестнадцатеричное число'); // Hexadecimal number expected
  cxSetResourceString(@scxRegExprHexNumberExpected, 'Ожидалось шестнадцатеричное число, но найдено ''%s'''); // Hexadecimal number expected but '%s' found
  cxSetResourceString(@scxRegExprMissing, 'Пропущено ''%s'''); // Missing '%s'
  cxSetResourceString(@scxRegExprUnnecessary, 'Излишняя ''%s'''); // Unnecessary '%s'
  cxSetResourceString(@scxRegExprIncorrectSpace, 'Пробел не позволяется после ''\'''); // The space character is not allowed after '\'
  cxSetResourceString(@scxRegExprNotCompiled, 'Регулярное выражение не завершено'); // Regular expression is not compiled
  cxSetResourceString(@scxRegExprIncorrectParameterQuantifier, 'Incorrect parameter quantifier'); // Incorrect parameter quantifier
  cxSetResourceString(@scxRegExprCantUseParameterQuantifier, 'The parameter quantifier cannot be applied here'); // The parameter quantifier cannot be applied here
  //
  cxSetResourceString(@scxMaskEditRegExprError, 'Ошибки в регулярном выражении:'); // Regular expression errors:
  cxSetResourceString(@scxMaskEditInvalidEditValue, 'Редактируемое значение неверно'); // The edit value is invalid
  cxSetResourceString(@scxMaskEditNoMask, 'None'); // None
  cxSetResourceString(@scxMaskEditIllegalFileFormat, 'Неверный формат файла'); // Illegal file format
  cxSetResourceString(@scxMaskEditEmptyMaskCollectionFile, 'Файл с набором масок пуст'); // The mask collection file is empty
  cxSetResourceString(@scxMaskEditMaskCollectionFiles, 'Файлы с наборами масок'); // Mask collection files
//  cxSetResourceString(@cxSSpinEditInvalidNumericValue, 'Неверное числовое значение'); // Invalid numeric value
  //Datacontroller
  cxSetResourceString(@cxSDataReadError, 'Ошибка чтения из потока'); // Stream read error
  cxSetResourceString(@cxSDataWriteError, 'Ошибка записи в поток'); // Stream write error
  cxSetResourceString(@cxSDataItemExistError, 'Элемент уже существует'); // Item already exists
  cxSetResourceString(@cxSDataRecordIndexError, 'Индекс записи за пределами диапазона'); // RecordIndex out of range
  cxSetResourceString(@cxSDataItemIndexError, 'Индекс элемента за пределами диапазона'); // ItemIndex out of range
  cxSetResourceString(@cxSDataProviderModeError, 'Эта операция не поддерживается в режиме ''provider'''); // This operation is not supported in provider mode
  cxSetResourceString(@cxSDataInvalidStreamFormat, 'Неверный формат потока'); // Invalid stream format
  cxSetResourceString(@cxSDataRowIndexError, 'Индекс строки за пределами диапазона'); // RowIndex out of range
  cxSetResourceString(@cxSDataCustomDataSourceInvalidCompare, 'GetInfoForCompare не реализованно'); // GetInfoForCompare not implemented
  cxSetResourceString(@cxSDBDetailFilterControllerNotFound, 'DetailFilterController не найден'); // DetailFilterController not found
  cxSetResourceString(@cxSDBNotInGridMode, 'DataController не в режиме GridMode'); // DataController not in GridMode
//  cxSetResourceString(@cxSDBKeyFieldNotFound, 'Ключевое поле не найдено'); // Key Field not found
  //Filter
  cxSetResourceString(@cxSFilterOperatorEqual, 'рівен'); // equals
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'не рівен'); // does not equal
  cxSetResourceString(@cxSFilterOperatorLess, 'менш ніж'); // is less than
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'менш або рівен ніж'); // is less than or equal to
  cxSetResourceString(@cxSFilterOperatorGreater, 'більш ніж'); // is greater than
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'більш або рівен ніж'); // is greater than or equal to
  cxSetResourceString(@cxSFilterOperatorLike, 'схожий на'); // like
  cxSetResourceString(@cxSFilterOperatorNotLike, 'не схожий на'); // not like
  cxSetResourceString(@cxSFilterOperatorBetween, 'між'); // between
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'не входить до'); // not between
  cxSetResourceString(@cxSFilterOperatorInList, 'в'); // in
  cxSetResourceString(@cxSFilterOperatorNotInList, 'не входить до'); // not in

  cxSetResourceString(@cxSFilterOperatorYesterday, 'вчора'); // is yesterday
  cxSetResourceString(@cxSFilterOperatorToday, 'сьогодні'); // is today
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'завтра'); // is tomorrow
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'останній тиждень'); // is last week
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'останній місяць'); // is last month
  cxSetResourceString(@cxSFilterOperatorLastYear, 'останній рік'); // is last year
  cxSetResourceString(@cxSFilterOperatorThisWeek, 'у цьому тижні'); // is this week
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'у цьому місяці'); // is this month
  cxSetResourceString(@cxSFilterOperatorThisYear, 'у цьому році'); // is this year
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'наступний тиждень'); // is next week
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'наступний місяць'); // is next month
  cxSetResourceString(@cxSFilterOperatorNextYear, 'наступний рік'); // is next year
  cxSetResourceString(@cxSFilterAndCaption, 'і'); // and
  cxSetResourceString(@cxSFilterOrCaption, 'або'); // or
  cxSetResourceString(@cxSFilterNotCaption, 'не'); // not
  cxSetResourceString(@cxSFilterBlankCaption, 'пусто'); // blank
  cxSetResourceString(@cxSFilterOperatorIsNull, 'пустой'); // is blank
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'не пустой'); // is not blank
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'починається з'); // begins with
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'не починається с'); // does not begin with
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'закінчується на'); // ends with
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'не закінчується на'); // does not end with
  cxSetResourceString(@cxSFilterOperatorContains, 'містить'); // contains
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'не містить'); // does not contain
  cxSetResourceString(@cxSFilterBoxAllCaption, '(Все)'); // (All)
  cxSetResourceString(@cxSFilterBoxCustomCaption, '(Спеціальний...)'); // (Custom...)
  cxSetResourceString(@cxSFilterBoxBlanksCaption, '(Порожні)'); // (Blanks)
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption, '(Не порожні)'); // (NonBlanks)

  cxSetResourceString(@cxSFilterBoolOperatorAnd, 'І'); // AND
  cxSetResourceString(@cxSFilterBoolOperatorOr, 'АБО'); // OR
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd, 'НЕ І'); // NOT AND
  cxSetResourceString(@cxSFilterBoolOperatorNotOr, 'НЕ АБО'); // NOT OR

  cxSetResourceString(@cxSFilterRootButtonCaption, 'Фільтр'); // Filter
  cxSetResourceString(@cxSFilterAddCondition, 'Додати &Умову'); // Add &Condition
  cxSetResourceString(@cxSFilterAddGroup, 'Додати &Групу'); // Add &Group
  cxSetResourceString(@cxSFilterRemoveRow, '&Видалити Строку'); // &Remove Row
  cxSetResourceString(@cxSFilterClearAll, 'Очистити &Все'); // Clear &All
  cxSetResourceString(@cxSFilterFooterAddCondition, 'нажмите, чтобы добавить новое условие'); // press the button to add a new condition

  cxSetResourceString(@cxSFilterGroupCaption, 'Применяет следующие условия'); // applies to the following conditions
  cxSetResourceString(@cxSFilterRootGroupCaption, '<корень>'); // <root>
  cxSetResourceString(@cxSFilterControlNullString, '<пусто>'); // <empty>

  cxSetResourceString(@cxSFilterErrorBuilding, 'Невозможно создать фильтр из источника'); // Can't build filter from source

  cxSetResourceString(@cxSFilterDialogCaption, 'Настройка фильтра'); // Custom Filter
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Неверное значение'); // Invalid value
  cxSetResourceString(@cxSFilterDialogUse, 'Использовать'); // Use
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'для указания одного знака'); // to represent any single character
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'для указания группы знаков'); // to represent any series of characters
  cxSetResourceString(@cxSFilterDialogOperationAnd, 'И'); // AND
  cxSetResourceString(@cxSFilterDialogOperationOr, 'ИЛИ'); // OR
  cxSetResourceString(@cxSFilterDialogRows, 'Показать строки, для которых:'); // Show rows where:

  cxSetResourceString(@cxSFilterControlDialogCaption, 'Построитель Фильтра'); // Filter builder
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'untitled.flt'); // untitled.flt
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Открыть существующий фильтр'); // Open an existing filter
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Сохранить активный фильтр в файл'); // Save the active filter to file
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption, 'Со&хранить Как...'); // &Save As...
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption, '&Загрузить...'); // &Open...
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption, '&Применить'); // &Apply
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK'); // OK
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Отмена'); // Cancel
  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt'); // flt
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Фильтры (*.flt)|*.flt'); // Filters (*.flt)|*.flt
  //GridPopupMenu
  cxSetResourceString(@cxSGridNone, 'Никакой'); // None
  cxSetResourceString(@cxSGridSortColumnAsc, 'Сортировка по возрастанию'); // Sort Ascending
  cxSetResourceString(@cxSGridSortColumnDesc, 'Сортировка по убыванию'); // Sort Descending
//  cxSetResourceString(@cxSGridClearSorting, 'Убрать сортировку'); // Clear Sorting
  cxSetResourceString(@cxSGridGroupByThisField, 'Группировать по этому полю'); // Group By This Field
  cxSetResourceString(@cxSGridRemoveThisGroupItem, 'Убрать из группировки'); // Remove from grouping
  cxSetResourceString(@cxSGridGroupByBox, 'Панель группировки'); // Group By Box
  cxSetResourceString(@cxSGridAlignmentSubMenu, 'Выравнивание'); // Alignment
  cxSetResourceString(@cxSGridAlignLeft, 'Выровнять по левой'); // Align Left
  cxSetResourceString(@cxSGridAlignRight, 'Выровнять по правой'); // Align Right
  cxSetResourceString(@cxSGridAlignCenter, 'Выровнять по центру'); // Align Center
  cxSetResourceString(@cxSGridRemoveColumn, 'Удалить колонку'); // Remove This Column
  cxSetResourceString(@cxSGridFieldChooser, 'Выбор поля'); // Field Chooser
  cxSetResourceString(@cxSGridBestFit, 'Авто размещение'); // Best Fit
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Авто размещение (все колонки)'); // Best Fit (all columns)
  cxSetResourceString(@cxSGridShowFooter, 'Панель итогов'); // Footer
  cxSetResourceString(@cxSGridShowGroupFooter, 'Групировать панель итогов'); // Group Footers

  cxSetResourceString(@cxSGridSumMenuItem, 'Сумма'); // Sum
  cxSetResourceString(@cxSGridMinMenuItem, 'Минимум'); // Min
  cxSetResourceString(@cxSGridMaxMenuItem, 'Максимум'); // Max
  cxSetResourceString(@cxSGridCountMenuItem, 'Количество'); // Count
  cxSetResourceString(@cxSGridAvgMenuItem, 'Среднее'); // Average
  cxSetResourceString(@cxSGridNoneMenuItem, 'Нет'); // None
  //GridExport
  cxSetResourceString(@scxUnsupportedExport, 'Неподдерживаемый тип экспорта: %1'); // Unsupported export type: %1
  cxSetResourceString(@scxStyleManagerKill, 'Style Manager в данный момент используется и не может быть освобожден'); // The Style Manager is currently being used elsewhere and can not be released at this stage
  cxSetResourceString(@scxStyleManagerCreate, 'Невозможно создать style manager'); // Can't create style manager
  cxSetResourceString(@scxExportToHtml, 'Экспорт в Web страницу (*.html)'); // Export to Web page (*.html)
  cxSetResourceString(@scxExportToXml, 'Экспорт в XML документ (*.xml)'); // Export to XML document (*.xml)
  cxSetResourceString(@scxExportToText, 'Экспорт в формат текста (*.txt)'); // Export to text format (*.txt)
  cxSetResourceString(@scxEmptyExportCache, 'Кэш экспорта пуст'); // Export cache is empty
  cxSetResourceString(@scxIncorrectUnion, 'Неверное объединение ячеек'); // Incorrect union of cells
  cxSetResourceString(@scxIllegalWidth, 'Неверная ширина столбца'); // Illegal width of the column
  cxSetResourceString(@scxInvalidColumnRowCount, 'Неверное количество строк или столбцов'); // Invalid column or row count
  cxSetResourceString(@scxIllegalHeight, 'Неверная высота строки'); // Illegal height of the row
  cxSetResourceString(@scxInvalidColumnIndex, 'Индекс столбца %d за пределами диапазона'); // The column index %d out of bounds
  cxSetResourceString(@scxInvalidRowIndex, 'Индекс строки %d за пределами диапазона'); // The row index %d out of bounds
  cxSetResourceString(@scxInvalidStyleIndex, 'Неверный индекс стиля %d'); // Invalid style index %d
  cxSetResourceString(@scxExportToExcel, 'Экспорт в MS Excel (*.xls)'); // Export to MS Excel (*.xls)
  cxSetResourceString(@scxWorkbookWrite, 'Ошибка записи XLS файла'); // Error write XLS file
  cxSetResourceString(@scxInvalidCellDimension, 'Неверные размеры столбца'); // Invalid cell dimension
  cxSetResourceString(@scxBoolTrue, 'True'); // True
  cxSetResourceString(@scxBoolFalse, 'False'); // False
  //cxNavigator
  cxSetResourceString(@cxNavigatorHint_First, 'Первая запись'); // First record
  cxSetResourceString(@cxNavigatorHint_Prior, 'Предыдущая запись'); // Prior record
  cxSetResourceString(@cxNavigatorHint_PriorPage, 'Предыдущая страница'); // Prior page
  cxSetResourceString(@cxNavigatorHint_Next, 'Следующая запись'); // Next record
  cxSetResourceString(@cxNavigatorHint_NextPage, 'Следующая страница'); // Next page
  cxSetResourceString(@cxNavigatorHint_Last, 'Последняя запись'); // Last record
  cxSetResourceString(@cxNavigatorHint_Insert, 'Вставить запись'); // Insert record
  cxSetResourceString(@cxNavigatorHint_Delete, 'Удалить запись'); // Delete record
  cxSetResourceString(@cxNavigatorHint_Edit, 'Редактировать запись'); // Edit record
  cxSetResourceString(@cxNavigatorHint_Post, 'Сохранить запись'); // Post edit
  cxSetResourceString(@cxNavigatorHint_Cancel, 'Отменить редактирование'); // Cancel edit
  cxSetResourceString(@cxNavigatorHint_Refresh, 'Обновить данные'); // Refresh data
  cxSetResourceString(@cxNavigatorHint_SaveBookmark, 'Сохранить закладку'); // Save Bookmark
  cxSetResourceString(@cxNavigatorHint_GotoBookmark, 'Перейти к закладке'); // Goto Bookmark
  cxSetResourceString(@cxNavigatorHint_Filter, 'Фильтр данных'); // Filter data
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion, 'Удалить запись?'); // Delete record?

  // dxBars5
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCAPTION, 'Выберите значение'); // Select value
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGOK, 'OK'); // OK
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCANCEL, 'Отмена'); // Cancel
  cxSetResourceString(@dxSBAR_DIALOGOK, 'OK'); // OK
  cxSetResourceString(@dxSBAR_DIALOGCANCEL, 'Отмена'); // Cancel
  cxSetResourceString(@dxSBAR_COLOR_STR_0, 'Черный'); // Black
  cxSetResourceString(@dxSBAR_COLOR_STR_1, 'Красно-коричневый'); // Maroon
  cxSetResourceString(@dxSBAR_COLOR_STR_2, 'Зеленый'); // Green
  cxSetResourceString(@dxSBAR_COLOR_STR_3, 'Оливковый'); // Olive
  cxSetResourceString(@dxSBAR_COLOR_STR_4, 'Темно-синий'); // Navy
  cxSetResourceString(@dxSBAR_COLOR_STR_5, 'Фиолетовый'); // Purple
  cxSetResourceString(@dxSBAR_COLOR_STR_6, 'Телесный'); // Teal
  cxSetResourceString(@dxSBAR_COLOR_STR_7, 'Серый'); // Gray
  cxSetResourceString(@dxSBAR_COLOR_STR_8, 'Серебряный'); // Silver
  cxSetResourceString(@dxSBAR_COLOR_STR_9, 'Красный'); // Red
  cxSetResourceString(@dxSBAR_COLOR_STR_10, 'Ярко-зеленый'); // Lime
  cxSetResourceString(@dxSBAR_COLOR_STR_11, 'Желтый'); // Yellow
  cxSetResourceString(@dxSBAR_COLOR_STR_12, 'Голубой'); // Blue
  cxSetResourceString(@dxSBAR_COLOR_STR_13, 'Фуксия'); // Fuchsia
  cxSetResourceString(@dxSBAR_COLOR_STR_14, 'Аква'); // Aqua
  cxSetResourceString(@dxSBAR_COLOR_STR_15, 'Белый'); // White
  cxSetResourceString(@dxSBAR_COLORAUTOTEXT, '(автоматически)'); // (automatic)
  cxSetResourceString(@dxSBAR_COLORCUSTOMTEXT, '(произвольно)'); // (custom)
  cxSetResourceString(@dxSBAR_DATETODAY, 'Сегодня'); // Today
  cxSetResourceString(@dxSBAR_DATECLEAR, 'Очистить'); // Clear
  cxSetResourceString(@dxSBAR_DATEDIALOGCAPTION, 'Выберите дату'); // Select the date
  cxSetResourceString(@dxSBAR_TREEVIEWDIALOGCAPTION, 'Выберите элемент'); // Select item
  cxSetResourceString(@dxSBAR_IMAGEDIALOGCAPTION, 'Выберите элемент'); // Select item
  cxSetResourceString(@dxSBAR_IMAGEINDEX, 'Индекс Изображения'); // Image Index
  cxSetResourceString(@dxSBAR_IMAGETEXT, 'Текст'); // Text
  cxSetResourceString(@dxSBAR_PLACEFORCONTROL, 'Место для'); // The place for the
  cxSetResourceString(@dxSBAR_CANTASSIGNCONTROL, 'Вы не можете сопоставить один и тот же контрол более чем одному TdxBarControlContainerItem.'); // You cannot assign the same control to more than one TdxBarControlContainerItem.
  cxSetResourceString(@dxSBAR_WANTTORESETTOOLBAR, 'Вы действительно хотите сбросить изменения панели ''%s'' ?'); // Are you sure you want to reset the changes made to the '%s' toolbar?
  cxSetResourceString(@dxSBAR_WANTTORESETUSAGEDATA, 'Эта команда удалить все записи о командах, которые вы использовали в этом приложении, и восстановит настройки по умолчанию. Вы хотите продолжить?'); // This will delete the record of the commands you've used in this application and restore the default set of visible commands to the menus and toolbars. It will not undo any explicit customizations.   Are you sure you want to proceed?
  cxSetResourceString(@dxSBAR_BARMANAGERMORETHENONE, 'Форма должна содержать только один TdxBarManager'); // A Form should contain only a single TdxBarManager
  cxSetResourceString(@dxSBAR_BARMANAGERBADOWNER, 'TdxBarManager должен иметь владельца - TForm (TCustomForm)'); // TdxBarManager should have as its Owner - TForm (TCustomForm)
  cxSetResourceString(@dxSBAR_NOBARMANAGERS, 'Нет доступных TdxBarManagers'); // There are no TdxBarManagers available
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBAR, 'Вы действительно хотите удалить панель ''%s''?'); // Are you sure you want to delete the '%s' toolbar?
  cxSetResourceString(@dxSBAR_WANTTODELETECATEGORY, 'Вы действительно хотите удалить категорию ''%s''?'); // Are you sure you want to delete the '%s' category?
  cxSetResourceString(@dxSBAR_WANTTOCLEARCOMMANDS, 'Вы действительно хотите удалить все команды в категории ''%s''?'); // Are you sure you want to delete all commands in the '%s' category?
  cxSetResourceString(@dxSBAR_RECURSIVESUBITEMS, 'Вы не можете создавать рекурсивные подменю'); // You cannot create recursive subitems
  cxSetResourceString(@dxSBAR_COMMANDNAMECANNOTBEBLANK, 'Имя команды не может быть пустым. Введите имя.'); // A command name cannot be blank. Please enter a name.
  cxSetResourceString(@dxSBAR_TOOLBAREXISTS, 'Панель с именем ''%s'' уже существует. Введите другое имя.'); // A toolbar named '%s' already exists. Type another name.
  cxSetResourceString(@dxSBAR_RECURSIVEGROUPS, 'Вы не можете создавать рекурсивные группы'); // You cannot create recursive groups
  cxSetResourceString(@dxSBAR_DEFAULTCATEGORYNAME, 'По умолчанию'); // Default
  cxSetResourceString(@dxSBAR_CP_ADDSUBITEM, 'Добавить &подменю'); // Add &SubItem
  cxSetResourceString(@dxSBAR_CP_ADDBUTTON, 'Добавить &кнопку'); // Add &Button
  cxSetResourceString(@dxSBAR_CP_ADDITEM, 'Добавить &объект'); // Add &Item
  cxSetResourceString(@dxSBAR_CP_DELETEBAR, 'Удалить gанель'); // Delete Bar
  cxSetResourceString(@dxSBAR_CP_RESET, 'С&брос'); // &Reset
  cxSetResourceString(@dxSBAR_CP_DELETE, '&Удалить'); // &Delete
  cxSetResourceString(@dxSBAR_CP_NAME, '&Имя:'); // &Name:
  cxSetResourceString(@dxSBAR_CP_CAPTION, '&Заголовок:'); // &Caption:
  cxSetResourceString(@dxSBAR_CP_DEFAULTSTYLE, '&Основной стиль'); // Defa&ult style
  cxSetResourceString(@dxSBAR_CP_TEXTONLYALWAYS, 'Тол&ько текст (всегда)'); // &Text Only (Always)
  cxSetResourceString(@dxSBAR_CP_TEXTONLYINMENUS, 'То&лько текст (в меню)'); // Text &Only (in Menus)
  cxSetResourceString(@dxSBAR_CP_IMAGEANDTEXT, 'Картинка &и Текст'); // Image &and Text
  cxSetResourceString(@dxSBAR_CP_BEGINAGROUP, 'Начать &группу'); // Begin a &Group
  cxSetResourceString(@dxSBAR_CP_VISIBLE, '&Видимый'); // &Visible
  cxSetResourceString(@dxSBAR_CP_MOSTRECENTLYUSED, '&Наиболее частро используемое'); // &Most recently used
  cxSetResourceString(@dxSBAR_ADDEX, 'Добавить..'); // Add...
  cxSetResourceString(@dxSBAR_RENAMEEX, 'Переименовать...'); // Rename...
  cxSetResourceString(@dxSBAR_DELETE, 'Удалить'); // Delete
  cxSetResourceString(@dxSBAR_CLEAR, 'Очистить'); // Clear
  cxSetResourceString(@dxSBAR_VISIBLE, 'Видимый'); // Visible
  cxSetResourceString(@dxSBAR_OK, 'OK'); // OK
  cxSetResourceString(@dxSBAR_CANCEL, 'Отмена'); // Cancel
  cxSetResourceString(@dxSBAR_SUBMENUEDITOR, 'Редактор ПодМеню...'); // SubMenu Editor...
  cxSetResourceString(@dxSBAR_SUBMENUEDITORCAPTION, 'Редактор ПодМеню...'); // ExpressBars SubMenu Editor
  cxSetResourceString(@dxSBAR_INSERTEX, 'Вставить...'); // Insert...
  cxSetResourceString(@dxSBAR_MOVEUP, 'Переместить Вверх'); // Move Up
  cxSetResourceString(@dxSBAR_MOVEDOWN, 'Переместить Вниз'); // Move Down
  cxSetResourceString(@dxSBAR_POPUPMENUEDITOR, 'Редактор всплыающих меню...'); // PopupMenu Editor...
  cxSetResourceString(@dxSBAR_TABSHEET1, 'Панели Инструментов'); //  Toolbars
  cxSetResourceString(@dxSBAR_TABSHEET2, 'Комманды'); //  Commands
  cxSetResourceString(@dxSBAR_TABSHEET3, 'Настройки'); //  Options
  cxSetResourceString(@dxSBAR_TOOLBARS, 'Панели &Инструментов:'); // Toolb&ars:
  cxSetResourceString(@dxSBAR_TNEW, '&Новый...'); // &New...
  cxSetResourceString(@dxSBAR_TRENAME, 'П&ереименовать...'); // R&ename...
  cxSetResourceString(@dxSBAR_TDELETE, '&Удалить'); // &Delete
  cxSetResourceString(@dxSBAR_TRESET, '&Сбросить...'); // &Reset...
  cxSetResourceString(@dxSBAR_CLOSE, 'Закрыть'); // Close
  cxSetResourceString(@dxSBAR_CAPTION, 'Настройка'); // Customize
  cxSetResourceString(@dxSBAR_CATEGORIES, 'Кате&гории:'); // Cate&gories:
  cxSetResourceString(@dxSBAR_COMMANDS, 'Комманд&ы:'); // Comman&ds:
  cxSetResourceString(@dxSBAR_DESCRIPTION, 'Описание'); // Description
  cxSetResourceString(@dxSBAR_CUSTOMIZE, '&Настроить...'); // &Customize...
  cxSetResourceString(@dxSBAR_ADDREMOVEBUTTONS, '&Добавить или удалить кнопки'); // &Add or Remove Buttons
  cxSetResourceString(@dxSBAR_MOREBUTTONS, 'Больше кнопок'); // More Buttons
  cxSetResourceString(@dxSBAR_RESETTOOLBAR, '&Сбросить настройки'); // &Reset Toolbar
  cxSetResourceString(@dxSBAR_EXPAND, 'Развернуть (Ctrl-Down)'); // Expand (Ctrl-Down)
  cxSetResourceString(@dxSBAR_DRAGTOMAKEMENUFLOAT, 'Перетащите, чтобы сделать меню плавающим'); // Drag to make this menu float
  cxSetResourceString(@dxSBAR_TOOLBARNEWNAME, 'Custom'); // Custom
  cxSetResourceString(@dxSBAR_CATEGORYADD, 'Добавить категорию'); // Add Category
  cxSetResourceString(@dxSBAR_CATEGORYINSERT, 'Вставить категорию'); // Insert Category
  cxSetResourceString(@dxSBAR_CATEGORYRENAME, 'Переименовать категорию'); // Rename Category
  cxSetResourceString(@dxSBAR_TOOLBARADD, 'Добавить панель инструментов'); // Add Toolbar
  cxSetResourceString(@dxSBAR_TOOLBARRENAME, 'Переименовать панель'); // Rename Toolbar
  cxSetResourceString(@dxSBAR_CATEGORYNAME, '&Имя категории:'); // &Category name:
  cxSetResourceString(@dxSBAR_TOOLBARNAME, '&Имя панели:'); // &Toolbar name:
  cxSetResourceString(@dxSBAR_CUSTOMIZINGFORM, 'Форма настройки...'); // Customization Form...
  cxSetResourceString(@dxSBAR_MODIFY, '... изменить'); // ... modify
  cxSetResourceString(@dxSBAR_PERSMENUSANDTOOLBARS, 'Мои настройки меню и панелей'); // Personalized Menus and Toolbars
  cxSetResourceString(@dxSBAR_MENUSSHOWRECENTITEMS, '&Недавно использованные команды в Меню'); // Me&nus show recently used commands first
  cxSetResourceString(@dxSBAR_SHOWFULLMENUSAFTERDELAY, 'Отображать п&олные меню просле небольшой задержки'); // Show f&ull menus after a short delay
  cxSetResourceString(@dxSBAR_RESETUSAGEDATA, '&Сбросить мои настройки'); // &Reset my usage data
  cxSetResourceString(@dxSBAR_OTHEROPTIONS, 'Другие'); // Other
  cxSetResourceString(@dxSBAR_LARGEICONS, '&Большие иконки'); // &Large icons
  cxSetResourceString(@dxSBAR_HINTOPT1, 'Показывать подсказки в панелях'); // Show Tool&Tips on toolbars
  cxSetResourceString(@dxSBAR_HINTOPT2, 'Показывать клавиатурные комбинации в подсказках'); // Show s&hortcut keys in ToolTips
  cxSetResourceString(@dxSBAR_MENUANIMATIONS, '&Анимация в меню:'); // &Menu animations:
  cxSetResourceString(@dxSBAR_MENUANIM1, '(нет)'); // (None)
  cxSetResourceString(@dxSBAR_MENUANIM2, 'Случайный выбор'); // Random
  cxSetResourceString(@dxSBAR_MENUANIM3, 'Развертывание'); // Unfold
  cxSetResourceString(@dxSBAR_MENUANIM4, 'Соскальзывание'); // Slide
  cxSetResourceString(@dxSBAR_MENUANIM5, 'Угасание'); // Fade
end;

end.
