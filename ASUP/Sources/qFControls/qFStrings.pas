{*******************************************************************************
* qFStrings                                                                    *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Константы                                                                    *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit qFStrings;

interface

const
    qFHighlightColor = $8080FF;
    qFDefaultLabelColor = $008000;
    qFBlockedColor = $EBEBEB;
    qFSpravColor = $F5E1E0;
    qFDefaultInterval = 120;
    qFDefaultWidth = 200;
    qFDefaultHeight = 21;
    qFDButtonSize = 21;
    qFMouseY = qFDefaultHeight div 2;
    qFMouseX = 10;
    qFDefaultDisplayName = 'Назва поля';
    qFFieldIsEmpty = 'Не заповнено поле ';
    qFErrorCaption = 'Помилка!';
    qFInformCaption = 'Увага!'; // vallkor
    qFConfirmCaption = 'Підтвердження';
    qFYesCaption = 'Так';
    qFNoCaption = 'Ні';
    qFControlBlocked = 'Не можна змінити значення у режимі перегляду!';
    qFNotInteger = ': поле має бути цілим числом!';
    qFNegative = ': поле не може бути від''ємним!';
    qFZero = ': поле не може бути нулем!';
    qFNotFloat = ': поле має бути числом!';
    qFMustBe = 'Повинно бути';
    qFErrorMsg = 'При занесенні у бази виникла помилка';
    qFLockErrorMsg = 'Інший користувач блокує цей запис! Спробуйте ще через деякий час.';
    qFGetErrorMsg = 'При отриманні даних з бази виникла помилка';
    qFConfirmDeleteMsg = 'Ви справді бажаєте вилучити цей запис?';
    qFEmpty = 'Немає даних!';
    qFCantCreateForm = 'Неможливо створити форму (клас не зареєстрований?)';
    qFNoDatabase = 'Не підключена база даних!';
    qFSpravHint = 'Щоб відкрити довідник, натисніть <Ctrl+Enter>';
    qFCantPrepare = 'Не можливо підготувати форму: немає ключа (where)!';
    qFCantOk = 'Не можливо занести дані: немає ключа (where)!';
    qFPeriodError = 'Невірно введені дати періоду. ';
    qFDateFieldIsEmpty = 'Не заповнено поле дати ';

implementation

end.
