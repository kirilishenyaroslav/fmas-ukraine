{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник вилок"                               }
{                 Работа со справочником вилок                                 }
{                                               ответственный: Тимофеев Антон  }

unit U_SPoklminmax;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGrid, Buttons, ExtCtrls, PersonalCommon,
    FIBQuery, pFIBQuery, uSearchFrame;

type
    TForm_SP_OKL_MIN_MAX = class(TForm)
        SpGridDBTableView1: TcxGridDBTableView;
        SpGridLevel1: TcxGridLevel;
        SpGrid: TcxGrid;
        DataSet_Vilki: TpFIBDataSet;
        DataSource1: TDataSource;
        SpGridDBTableView1DBGR_Name: TcxGridDBColumn;
        SpGridDBTableView1DBPost_Name: TcxGridDBColumn;
        SpGridDBTableView1DBMin: TcxGridDBColumn;
        SpGridDBTableView1DBMax: TcxGridDBColumn;
        Panel1: TPanel;
        SpeedButton_AddOne: TSpeedButton;
        SpeedButton_UpdateOne: TSpeedButton;
        SpeedButton_DeleteOne: TSpeedButton;
        SpeedButton_Close: TSpeedButton;
        SpeedButton_AddGroup: TSpeedButton;
        SpeedButton_UpdateGroup: TSpeedButton;
        SpeedButton_DeleteGroup: TSpeedButton;
        FIBQuery: TpFIBQuery;
        Ok: TSpeedButton;
        SearchFrame: TfmSearch;
        SpeedButton_Refresh: TSpeedButton;
        procedure SpeedButton_AddOneClick(Sender: TObject);
        procedure SpeedButton_DeleteOneClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure SpeedButton_DeleteGroupClick(Sender: TObject);
        procedure SpeedButton_CloseClick(Sender: TObject);
        procedure OkClick(Sender: TObject);
        procedure SpeedButton_RefreshClick(Sender: TObject);
        procedure SpeedButton_UpdateGroupClick(Sender: TObject);
        procedure SpeedButton_UpdateOneClick(Sender: TObject);
        procedure SpeedButton_AddGroupClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
        Confirmation: Boolean;
    { Public declarations }
    end;

type Group_Id_Name = record
        Id: string;
        Name: string;
    end;

var
    Form_SP_OKL_MIN_MAX: TForm_SP_OKL_MIN_MAX;
    Res: Group_Id_Name;

procedure PSP_OKLMINMAX(AOwner: TComponent; confirm: Boolean);

implementation

uses UAddVilka, UChangeVGroup, UChangeMinMax;
{$R *.dfm}

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_AddOneClick(Sender: TObject);
var Form_Add_Vilka: TForm_Add_Vilka;
begin
    Form_Add_Vilka := TForm_Add_Vilka.Create(Self);
    Form_Add_Vilka.ShowModal;
    Form_Add_Vilka.Free;
    SpeedButton_Refresh.Click;
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_DeleteOneClick(Sender: TObject);
begin
    if DataSet_Vilki.IsEmpty
        then begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DataSet_Vilki['Id_okl_min_max'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if Confirmation
        then if (MessageDlg('Чи ви справді бажаєте вилучити запис "' +
            DataSet_Vilki['Gr_Name'] + ', ' + DataSet_Vilki['Post_Name'] +
            '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    try
        FIBWriteTransaction.StartTransaction;
        FIBQuery.SQL.Text := 'execute procedure SP_OKL_MIN_MAX_DELETE(' + IntToStr(DataSet_Vilki['Id_okl_min_max']) + ');';
        FIBQuery.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
        end;
    end;
    SpeedButton_Refresh.Click;
end;

procedure TForm_SP_OKL_MIN_MAX.FormCreate(Sender: TObject);
begin
    DataSet_Vilki.Database := PersonalCommon.FIBDatabase;
    DataSet_Vilki.Transaction := FIBReadTransaction;
    DataSet_Vilki.Open;
    FIBQuery.Database := PersonalCommon.FIBDatabase;
    FIBQuery.Transaction := FIBWriteTransaction;
    SearchFrame.Prepare(DataSet_Vilki, nil);
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_DeleteGroupClick(
    Sender: TObject);
begin
    if DataSet_Vilki.IsEmpty
        then MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0)
    else
    begin
        if Confirmation
            then
        begin
            if (MessageDlg('Ви бажаєте вилучити групу "' + DataSet_Vilki['Gr_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
                then Exit;
            if (MessageDlg('Ви впевнені, що бажаєте вилучити групу "' + DataSet_Vilki['Gr_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
                then Exit;
        end;
        try
            FIBWriteTransaction.StartTransaction;
            FIBQuery.SQL.Text := 'execute procedure SP_OKL_MIN_MAX_GROUP_D(' + IntToStr(DataSet_Vilki['Id_okl_min_max_group']) + ');';
            FIBQuery.ExecProc;
            FIBWriteTransaction.Commit;
        except on e: Exception do
            begin
                MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
                FIBWriteTransaction.RollBack;
            end;
        end;
        SpeedButton_Refresh.Click;
    end;
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_CloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Close;
end;

procedure TForm_SP_OKL_MIN_MAX.OkClick(Sender: TObject);
begin

    ModalResult := mrOk;
 {if FormStyle = fsMDIChild then }Close;
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_RefreshClick(Sender: TObject);
var id: integer;
begin
    if DataSet_Vilki['Id_okl_min_max'] = Null
        then begin
        DataSet_Vilki.CloseOpen(False);
        SearchFrame.Refresh;
        SpGrid.Refresh; Exit;
    end;

    id := DataSet_Vilki['Id_okl_min_max'];

    DataSet_Vilki.CloseOpen(False);
    SearchFrame.Refresh;
    SpGrid.Refresh;

    DataSet_Vilki.Locate('Id_Okl_Min_Max', Id, []);
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_UpdateGroupClick(
    Sender: TObject);
var Form_Change_Group: TForm_Change_Group;
begin
    if DataSet_Vilki.IsEmpty
        then MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0)
    else
    begin
        if Confirmation
            then if (MessageDlg('Чи ви справді бажаєте змінити назву групи: "' +
                DataSet_Vilki['Gr_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
            then Exit;
        Form_Change_Group := TForm_Change_Group.Create(Self);
        Form_Change_Group.Id := DataSet_Vilki['Id_okl_min_max_group'];
        Form_Change_Group.Add := False;
        Form_Change_Group.ShowModal;
        SpeedButton_Refresh.Click;
    end;
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_UpdateOneClick(Sender: TObject);
var Form_ChangeMinMax: TForm_ChangeMinMax;
begin
    if (DataSet_Vilki['Id_okl_min_max'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;

    if DataSet_Vilki.IsEmpty
        then MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0)
    else
    begin
        if Confirmation
            then if (MessageDlg('Чи ви справді бажаєте змінити вілку окладу: "' +
                DataSet_Vilki['Post_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
            then Exit;

        Form_ChangeMinMax := TForm_ChangeMinMax.Create(Self);
        Form_ChangeMinMax.Id := DataSet_Vilki['Id_okl_min_max'];
        Form_ChangeMinMax.CheckEdit_Min.Text := FloatToStr(DataSet_Vilki['okl_min']);
        Form_ChangeMinMax.CheckEdit_Max.Text := FloatToStr(DataSet_Vilki['okl_max']);
        Form_ChangeMinMax.ShowModal;
        SpeedButton_Refresh.Click;
    end;
end;

procedure TForm_SP_OKL_MIN_MAX.SpeedButton_AddGroupClick(Sender: TObject);
var Form_Change_Group: TForm_Change_Group;
begin
    Form_Change_Group := TForm_Change_Group.Create(Self);
    Form_Change_Group.Add := True;
    Form_Change_Group.Caption := 'Додати групу';
    Form_Change_Group.ShowModal;
    SpeedButton_Refresh.Click;
end;

//Процедура отображения формы справочника как MDI Child

procedure PSP_OKLMINMAX(AOwner: TComponent; confirm: Boolean);
var FormSP: TForm_SP_OKL_MIN_MAX;
begin
    FormSP := TForm_SP_OKL_MIN_MAX.Create(AOwner);
    FormSP.FormStyle := fsMDIChild;
    FormSP.Confirmation := confirm;
end;

//Функция выбора группы вилок. Выход идентификатор и название группы

function SelectGroup(AOwner: TComponent): Group_Id_Name;
var FormSP: TForm_SP_OKL_MIN_MAX;
begin
    FormSP := TForm_SP_OKL_MIN_MAX.Create(AOwner);
    FormSP.FormStyle := fsMDIChild;
    FormSP.Visible := False;
    FormSP.ShowModal;


    if FormSP.ModalResult = mrOk
        then
    begin
        Result.Id := FormSP.DataSet_Vilki['Id_okl_min_max_group'];
        Result.Name := FormSP.DataSet_Vilki['Gr_Name'];
    end
    else
    begin
        Result.Id := '---<none>---';
    end;
end;

procedure TForm_SP_OKL_MIN_MAX.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Action := caFree;
end;

end.
