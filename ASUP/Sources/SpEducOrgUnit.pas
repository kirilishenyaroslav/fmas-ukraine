
{ -$Id: SpEducOrgUnit.pas,v 1.4 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Справочник учебных заведений"                    }
{         Отображение списка учебных заведений.                                }
                                                   {         Вызов формы для редактирования учебного заведения                    }
{         Ответственный: Данил Збуривский                                      }

unit SpEducOrgUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls,
    ComCtrls, Buttons, ToolWin, Grids, DBGrids, PersonalCommon, EditControl,
    DBCtrls, SpCommon, uSearchFrame;

type
    TSpEducOrgForm = class(TSpForm)
        ResultQueryID_ORG: TIntegerField;
        ResultQueryNAME_SHORT: TIBStringField;
        ResultQueryID_ADRESS: TIntegerField;
        ResultQueryAKREDITATION: TIntegerField;
        ResultQueryIS_LEARNING: TIntegerField;
        ResultQueryIS_KVALIF: TIntegerField;
        ResultQueryNAME_FULL: TIBStringField;
        SearchQuery: TIBQuery;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ResultQueryIS_LEARNINGGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure ResultQueryIS_KVALIFGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure DeleteButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure SpGridCellClick(Column: TColumn);
    private
    public
        procedure Refresh; override;
        procedure ShowChangeForm(Mode: TEditMode);
    end;

var
    SpEducOrgForm: TSpEducOrgForm;

implementation
uses AddEducOrgUnit;

{$R *.DFM}


procedure TSpEducOrgForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddEducOrgForm;
    id: Integer;
    Ans: TModalResult;
begin
    form := TAddEducOrgForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_Org']
    else id := -1;
    form.Prepare(id, Mode);
    Ans := form.ShowModal;

    if (Mode = emNew) and (Ans = mrOk) then
    begin
        Refresh;
        ResultQuery.Locate('ID_ORG', form.LId, []);
    end;

    if (Mode <> emNew) and (Ans = mrOk) then Refresh;
    form.Free;

end;


procedure TSpEducOrgForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TSpEducOrgForm.ModifyButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ShowChangeForm(emModify);
end;

procedure TSpEducOrgForm.Refresh;
begin
    inherited Refresh;
end;


procedure TSpEducOrgForm.ResultQueryIS_LEARNINGGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    inherited;
    if ResultQueryIS_LEARNING.asInteger = 1 then
        Text := 'Так';
    if ResultQueryIS_LEARNING.asInteger = 2 then
        Text := 'Ні';


end;

procedure TSpEducOrgForm.ResultQueryIS_KVALIFGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    inherited;
    if ResultQueryIS_KVALIF.asInteger = 1 then
        Text := 'Так';
    if ResultQueryIS_KVALIF.asInteger = 2 then
        Text := 'Ні';

end;

procedure TSpEducOrgForm.DeleteButtonClick(Sender: TObject);
begin
    if
        MessageDlg
        ('Чи ви справді бажаєте вилучити запис?', mtconfirmation, [mbYes, MbNo], 0) = mrYes
        then
    begin
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE SP_EDUCORG_DELETE(' + IntToStr(ResultQueryID_ORG.Value) + ');';
        ExecQuery(WorkQuery);
        QueryRefresh(ResultQuery);
    end;
end;

procedure TSpEducOrgForm.SearchEditChange(Sender: TObject);
begin

    if SearchFrame.SearchEdit.Text <> '' then
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Org,Name_Full,Name_Short,Id_Adress,Akreditation,Is_Learning,Is_Kvalif');
        ResultQuery.SQL.Add(' FROM Sp_EducOrg WHERE UPPER(NAME_FULL COLLATE PXW_CYRL) CONTAINING ''' + UpperCase(SearchFrame.SearchEdit.Text) + ''' ORDER BY NAME_FULL');

        ResultQuery.Close;
        ResultQuery.Open;
    end
    else
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Org,Name_Full,Name_Short,Id_Adress,Akreditation,Is_Learning,Is_Kvalif');
        ResultQuery.SQL.Add(' FROM Sp_EducOrg ORDER BY NAME_FULL');

        ResultQuery.Close;
        ResultQuery.Open;

    end;

end;

procedure TSpEducOrgForm.FormCreate(Sender: TObject);
begin
    inherited;
    SearchQuery.Transaction := PersonalCommon.ReadTransaction;

end;

procedure TSpEducOrgForm.SpGridCellClick(Column: TColumn);
begin
    SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text;

end;

initialization
    RegisterClass(TSpEducOrgForm);
end.
