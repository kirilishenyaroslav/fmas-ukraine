unit AllPeopleUnit;
// Вообще-то это - загрузчик, а окно в Main

interface
uses SysUtils, Classes, IBase, Variants, Controls, SpPeople_MainForm, SpPeople_ModForm, SpPeople_Types,
    PeopleModUnit, AllPeopleDataModule;

const
    SelAllPeopleProcName = 'GET_ALL_PEOPLE_LIST';
    SelUnemployedProcName = 'GET_UNEMPLOYED_PEOPLE_LIST';
    SelUnemployedProcName1 = 'GET_UNEMPLOYED_PEOPLE_LIST1';
    SelPeopleStudWithoutEdbo = 'GET_PEOPLE_STUD_WITHOUT_EDBO';
    SelImportedPeopleFromEdbo = 'GET_ALL_PEOPLE_FROM_EDBO';
    SelAllStudWithoutEdbo = 'CN_DT_ID_MAN_UPD';

function GetMan(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

procedure ShowSp(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True); stdcall;

function ShowManEditForm(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;
    IdMan: Integer; CanEdit: Boolean = False): Variant; stdcall;

function GetManForASUP(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

procedure ShowSpPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True); stdcall;

function GetManPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetManForASUPPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

procedure ShowSpUnemployed(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True); stdcall;

function GetManUnemployed(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetManWithDog(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetManWorked(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; Date_Beg: TDate; Date_End: TDate; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetManFromEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetImportedManFromEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1): Variant; stdcall;

function GetContractManWithoutEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1; IdMode: Integer = 0): Variant; stdcall;

exports GetMan, ShowSp, ShowManEditForm, GetManForASUP, ShowSpPrCards, GetManPrCards, GetManForASUPPrCards, ShowSpUnemployed,
    GetManUnemployed, GetManWithDog, GetManWorked, GetManFromEdbo, GetImportedManFromEdbo, GetContractManWithoutEdbo;

implementation

function GetMan(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelAllPeopleProcName, Id_Man);
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

procedure ShowSp(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True);
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, True, False, False, SelAllPeopleProcName);
    SpForm.UnDeleteTnAction.Visible := True;
    SpForm.UnDeleteTnBtn.Visible := True;
end;

function ShowManEditForm(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;
    IdMan: Integer; CanEdit: Boolean = False): Variant;
var
    Mode: TEditMode;
begin
    SetUkrainian;
    if (CanEdit) then
        Mode := emModify
    else
        Mode := EmView;
    ShowModForm(AOwner, DB_HANDLE, Mode, IdMan);
    Result := Null;
end;

function GetManForASUP(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelAllPeopleProcName, Id_Man);
    SpForm.Timer1.Interval := 0; // Тут таймер отключается, а значит поиск осуществляется в ручном режиме
    SpForm.SearchBtn.Visible := True;
    SpForm.SearchPanel.Align := alTop;
    SpForm.UnDeleteTnAction.Visible := True;
    SpForm.UnDeleteTnBtn.Visible := True;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;
//******************************************************************************

procedure ShowSpPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True);
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, True, False, False, SelUnemployedProcName);
    {  SpForm.DSetPeople.Filter:='TN IS NULL';
      SpForm.DSetPeople.Filtered:=True;}
end;

function GetManPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelUnemployedProcName, Id_Man);
    {  SpForm.DSetPeople.Filter:='TN IS NULL';
      SpForm.DSetPeople.Filtered:=True;}
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetManForASUPPrCards(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelUnemployedProcName, Id_Man);
    {  SpForm.DSetPeople.Filter:='TN IS NULL';
      SpForm.DSetPeople.Filtered:=True;}
    SpForm.Timer1.Interval := 0; // Тут таймер отключается, а значит поиск осуществляется в ручном режиме
    SpForm.SearchBtn.Visible := True;
    SpForm.SearchPanel.Align := alTop;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

procedure ShowSpUnemployed(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = True); stdcall;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, True, False, False, SelUnemployedProcName1);
end;

function GetManUnemployed(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelUnemployedProcName1, Id_Man);
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetManWithDog(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelAllPeopleProcName, Id_Man);
    SpForm.pSelectWithDog := True;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetManWorked(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; Date_Beg: TDate; Date_End: TDate; MultiSelect: Boolean = False;
    CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, MultiSelect, SelAllPeopleProcName, Id_Man);
    SpForm.pSelectWorked := True;
    SpForm.pDate_Beg := Date_Beg;
    SpForm.pDate_End := Date_End;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetManFromEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, False, '', Id_Man, True);
    // при добавлении контракта физлицо не является студентом вуза,
    // из-за чего метод забора фото из ЕДБО возвращает ошибку
    // поэтому отключаем работу с фотографии в этом режиме
    SpForm.CanWorkWithImage := 0;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetImportedManFromEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1): Variant;
var
    SpForm: TfSpPeople;
begin
    //забираем контрактников, которые добавлены из ЕДБО для повторной синхронизации
    SetUkrainian;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, False, SelImportedPeopleFromEdbo, Id_Man, True);
    // при работе с контрактом физлицо обычно не является студентом вуза,
    // из-за чего метод забора фото из ЕДБО возвращает ошибку
    // поэтому отключаем работу с фотографии в этом режиме
    SpForm.DSetPeople.SQLs.SelectSQL.Text:='Select * from '+ SelImportedPeopleFromEdbo;

    SpForm.DSetPeople.Open;
    SpForm.CanWorkWithImage := 0;
    SpForm.ResyncEDBO.Visible := True;
    SpForm.ResyncEDBO.Action :=SpForm.ResyncAllDataEDBO;
    SpForm.btnSyncWithEdbo.Visible := False;
    SpForm.SelectBtn.Visible := False;
    //SpForm.RefreshBtn.Visible := False;
    SpForm.ResyncEDBO.Width := 120;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

function GetContractManWithoutEdbo(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; CanEdit: Boolean = False; Id_Man: Integer = -1; IdMode: Integer = 0): Variant;
var
    SpForm: TfSpPeople;
    NameSelProc: String;
begin
    //забираем контрактников, которые добавлены не из ЕДБО и проставляем им коды персон из ЕДБО
    SetUkrainian;
    case IdMode of
        0: NameSelProc := SelPeopleStudWithoutEdbo;
        1: NameSelProc := SelAllStudWithoutEdbo;
    end;
    SpForm := TfSpPeople.Create(AOwner, DBHANDLE, CanEdit, True, False, NameSelProc, Id_Man, True);
    // при работе с контрактом физлицо обычно не является студентом вуза,
    // из-за чего метод забора фото из ЕДБО возвращает ошибку
    // поэтому отключаем работу с фотографии в этом режиме
    SpForm.DSetPeople.SQLs.SelectSQL.Text:='Select * from '+ NameSelProc;
    SpForm.DSetPeople.Open;
    SpForm.CompareBirthDate := IdMode;
    SpForm.pSyncKodPersonEdbo := 1;
    SpForm.CanWorkWithImage := 0;
    SpForm.ResyncEDBO.Visible := True;
    SpForm.ResyncEDBO.Action :=SpForm.ResyncKodEdbo;
    SpForm.btnSyncWithEdbo.Visible := False;
    SpForm.SelectBtn.Visible := False; 
    SpForm.ResyncEDBO.Width := 120;
    if SpForm.ShowModal = mrOk then
        Result := SpForm.ResultArray;
    SpForm.Free;
end;

end.

