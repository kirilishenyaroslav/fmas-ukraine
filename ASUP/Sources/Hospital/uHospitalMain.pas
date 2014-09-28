{*******************************************************************************
* uHospitalMain                                                             *
*                                                                              *
* Главный модуль больничных                                                    *
* Copyright ©  2004-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}


unit uHospitalMain;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase, IBDatabase, IBQuery;

type
    THospitalSprav = class(TSprav)
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
        procedure OpenData;
    end;

var
    AdminMode: Boolean;
    DB: TIBDatabase;
    ReadTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
    DepNameQuery: TIBQuery;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

function CheckAccess(Path: string; Action: string; DisplayMessage: Boolean = False): Integer;

implementation

uses Variants, SysUtils, IBExternals, AccMgmt, uManHospital, uEditHosp, SpCommon,
    uHospFilter;

function CheckAccess(Path: string; Action: string; DisplayMessage: Boolean = False): Integer;
var
    i: Integer;
begin
    i := 0;
    if (not AdminMode) then
    begin
        begin
            i := fibCheckPermission(Path, Action);
            if i <> 0 then
            begin
                if DisplayMessage then
                    MessageDlg(AcMgmtErrMsg(i), mtError, [mbOk], 0);
            end;
        end;
    end;
    CheckAccess := i;
end;


function CreateSprav: TSprav;
begin
    Result := THospitalSprav.Create;
end;

destructor THospitalSprav.Destroy;
begin
    DepNameQuery.Free;
    WriteTransaction.Free;
    ReadTransaction.Free;
    DB.Free;
end;

constructor THospitalSprav.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('Admin_Mode', ftInteger);
    Input.FieldDefs.Add('Show_Edit_Form', ftInteger);
    Input.FieldDefs.Add('Input_Id_Pcard', ftInteger);
    Input.FieldDefs.Add('Input_Id_Man_Hosp', ftInteger);
    Input.FieldDefs.Add('NewVersion', ftBoolean);

    Output.FieldDefs.Add('Id_Man_Hosp', ftInteger);
    Output.FieldDefs.Add('Id_PCard', ftInteger);
    Output.FieldDefs.Add('Seria', ftString, 10);
    Output.FieldDefs.Add('Nomer', ftString, 10);
    Output.FieldDefs.Add('FIO', ftString, 60);
    Output.FieldDefs.Add('TN', ftInteger);
    Output.FieldDefs.Add('Date_Beg', ftDate);
    Output.FieldDefs.Add('Date_End', ftDate);
    Output.FieldDefs.Add('DisplayText', ftString, 255);
    Output.FieldDefs.Add('Ending', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure THospitalSprav.OpenData;
var
    hnd: Integer;
begin
    DB := TIBDatabase.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DB.SetHandle(Ibexternals.PVoid(hnd));

    ReadTransaction := TIBTransaction.Create(DB);
    ReadTransaction.DefaultDatabase := DB;
    ReadTransaction.Params.Add('read_committed');

    WriteTransaction := TIBTransaction.Create(DB);
    WriteTransaction.DefaultDatabase := DB;

     //Открыть запрос для получения названия текущего подр.
    DepNameQuery := TIBQuery.Create(Application.MainForm);
    DepNameQuery.Transaction := ReadTransaction;
    DepNameQuery.SQL.Text := 'SELECT Id_Department, Name_Full FROM Sp_Department D' +
        ' INNER JOIN Ini_Asup_Consts C ON D.Id_Department = C.Local_Department' +
        ' WHERE CURRENT_TIMESTAMP BETWEEN D.Use_Beg AND D.Use_End';
    DepNameQuery.Open;

    if Input['Admin_Mode'] = 1 then AdminMode := True
    else AdminMode := False;

    if VarIsNull(Input['NewVersion']) then
    begin
        Input.Edit;
        Input['NewVersion'] := True;
        Input.Post;
    end;
end;

procedure THospitalSprav.Show;
var
    form: TfmManHospital;
    editForm: TfmEditHosp;
    FilterForm: TfmHospFilter;
    FilterString: String;
    RusFIO: Boolean;
begin
    OpenData;

    if not VarIsNull(Input['Show_Edit_Form']) and
        (Input['Show_Edit_Form'] = 1) then
    begin
        editForm := TfmEditHosp.Create(Application.MainForm);
        editForm.IDPCARD := Input['Input_Id_PCard'];
        editForm.Prepare(emView, Input['Input_Id_Man_Hosp'], Input['NewVersion']);

        editForm.ShowModal;
        editForm.Free;
    end
    else
    begin
        FilterForm := TfmHospFilter.Create(Application.MainForm, Input['NewVersion']);
        if FilterForm.ShowModal = mrOk then
        begin
            FilterString := FilterForm.FilterString.Value;
            RusFIO := FilterForm.RusFIO.Value;
            FilterForm.Free;
        end
        else
        begin
            FilterForm.Free;
            Exit;
        end;

        if Input['Select'] = 0 then
        begin
            form := TfmManHospital.Create(Application.MainForm, Self, FilterString, RusFIO, Input['NewVersion']);
            form.FormStyle := fsMDIChild;
            form.WindowState := wsMaximized;
            form.Show;
        end
        else
        begin
            form := TfmManHospital.Create(Application.MainForm, Self, FilterString, RusFIO, Input['NewVersion']);
            form.OkButton.Visible := True;
            form.ShowModal;
            form.Free;
        end;
    end
end;

end.

