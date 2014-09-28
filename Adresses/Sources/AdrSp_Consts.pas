unit AdrSp_Consts;

interface
//******************************************************************************
//                    Надписи на украинском и русском языках
//******************************************************************************

const LanguageIndex = 1; // 1-украинский, 2-русский;

const InsertBtn_Caption            :array[1..2] of string = ('Додати','Добавить');
const AddAllBtn_Caption            :array[1..2] of string = ('Додати всіх','Добавить всех');
const DelAllBtn_Caption            :array[1..2] of string = ('Вилучити всіх','Удалить всех');
const UpdateBtn_Caption            :array[1..2] of string = ('Редагувати','Изменить');
const DeleteBtn_Caption            :array[1..2] of string = ('Видалити','Удалить');
const DetailBtn_Caption            :array[1..2] of string = ('Перегляд','Просмотр');
const ShowDetailsBtn_Caption       :array[1..2] of string = ('Детальніше','Детали');
const RefreshBtn_Caption           :array[1..2] of string = ('Поновити','Обновить');
const ExitBtn_Caption              :array[1..2] of string = ('Вийти','Выход');
const YesBtn_Caption               :array[1..2] of string = ('Прийняти','Принять');
const CancelBtn_Caption            :array[1..2] of string = ('Відмінити','Отменить');
const FilterBtn_Caption            :array[1..2] of string = ('Фільтр','Фильтр');
const LocateBtn_Caption            :array[1..2] of string = ('Шукати','Искать');
const LocateNextBtn_Caption        :array[1..2] of string = ('Далі','Дальше');
const SelectBtn_Caption            :array[1..2] of string = ('Обрати','Выбрать');
const SelectWithDependence_Caption :array[1..2] of string = ('Обрати з підлеглими','Выбрать с подчиненными');
const PropertiesBtn_Caption        :array[1..2] of string = ('Властивості','Свойства');

const InsertBtn_Hint               :array[1..2] of string = ('Ins - Додати','Ins - Добавить');
const UpdateBtn_Hint               :array[1..2] of string = ('F2 - Редагувати','F2 - Изменить');
const DeleteBtn_Hint               :array[1..2] of string = ('Del - Видалити','Del - Удалить');
const DetailBtn_Hint               :array[1..2] of string = ('Space - Перегляд','Space - Просмотр');
const SelectBtn_Hint               :array[1..2] of string = ('F10 - Обрати','F10 - Выбрать');
const ExitBtn_Hint                 :array[1..2] of string = ('Esc - Вихід','Esc - Выход');
const YesBtn_Hint                  :array[1..2] of string = ('F10 - Прийняти','F10 - Принять');
const CancelBtn_Hint               :array[1..2] of string = ('Esc - Відмінити','Esc - Отменить');
const RefreshBtn_Hint              :array[1..2] of string = ('F5 - Оновити','F5 - Обновить');
const LocateBtn_Hint               :array[1..2] of string = ('F7 - Шукати','F7 - Искать');
const LocateNextBtn_Hint           :array[1..2] of string = ('Ctrl+F7 - Далі','Ctrl+F7 - Дальше');
const FilterBtn_Hint               :array[1..2] of string = ('F8 - Фільтр','F8 - Фильтр');
const Error_Caption                :array[1..2] of string = ('Помилка','Ошибка');

function GetLanguageIndex:Integer;

implementation

function GetLanguageIndex:Integer;
begin
  Result:=LanguageIndex;
end;

end.
