unit SpPeople_Types;

interface
uses Controls;

type
    TEditMode = (emNew, emModify, emView);
    // Уже есть в SP_Lib.SpCommon

type
    TItemInfo = record
        IdMan: integer;
        FIO: string;
        Familia: string;
        Imya: string;
        Otchestvo: string;
        Rus_familia: string;
        Rus_Imya: string;
        Rus_Otchestvo: string;
        Birth_Date: TDateTime;
        Tin: string;
        Tn: integer;
    end;

type
    TPassRec = record
        Familia: string;
        Imya: string;
        Otchestvo: string;
        RusFamilia: string;
        RusImya: string;
        RusOtchestvo: string;
        Seria: string;
        Number: string;
        IdPassType: Integer;
        GrantDate: TDate; // Когда выдан
        GrantedBy: string; // Кем выдан
        ID_MAN: Integer; // Необходим для сверки ФИО и новых данных
        UpdateFIO: Boolean; // Корректировать ли ФИО
        ID_PAS_DATA: Int64; // Идентификатор паспорта
        WithOutOtchestvo: Boolean; // Признак, с отчеством физлицо или без
    end;

type
    TDogRec = record
        ID_DOG_BANKCARD: Int64;
        ID_MAN: Integer;
        TIN: string;
        ID_TYPE_PAYMENT: Integer;
        FULL_NAME_TYPE_PAYMENT: string;
        NUM_LIC_ACCAUNT: string;
        CONTROL_ID: string;
        DATE_DOG: TDate;
        DATE_BEG: TDate;
        DATE_END: TDate;
        NUM_DOG: string;
        COMENT: string;
        IS_DOG_CLOSE: Integer;
    end;

type
    TCardRec = record
        ID_BANKCARD: Int64;
        ID_DOG_BANKCARD: Int64;
        NUM_CARD: string;
        DATE_BEG: TDate;
        DATE_END: TDate;
        COMENT: string;
        ID_TYPE_BANKCARD: Integer;
        NAME_TYPE_BANKCARD: string;
        IS_CARD_CLOSE: Integer;
    end;
implementation

end.
