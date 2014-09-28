Unit uUpReportCard;
{*******************************************************************************
* uUpReportCard                                                                *
*                                                                              *
* Главный модуль отчета по личным карточкам                                    *
* Copyright © 2007, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCommonSp, DB, FIBDatabase, pFIBDatabase, IBase, ComCtrls,
    cxLookAndFeelPainters, StdCtrls, cxButtons, Gauges, pFIBStoredProc,
    FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
    FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
    cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox, cxCheckBox, cxTextEdit, cxMaskEdit, cxButtonEdit,
    cxControls, cxContainer, cxEdit, cxLabel, uUnivSprav;

Type
    TUpReportCard = Class(TSprav)
    Public
        Constructor Create;
        Procedure Show; Override;
        Destructor Destroy; Override;
    End;

Function CreateSprav: TSprav; stdcall;
Exports CreateSprav;

Type
    TfmMain = Class(TForm)
        StatusBar1: TStatusBar;
        cxButtonPrint: TcxButton;
        ActionList1: TActionList;
        PrintAction: TAction;
        DesAction: TAction;
        cxButtonClose: TcxButton;
        LevelEdit: TcxButtonEdit;
        cxLevel: TcxCheckBox;
        Constructor Create(aOwner: TComponent; HandleDb: Integer); Reintroduce;
        Procedure cxButtonCloseClick(Sender: TObject);
        Procedure PrintActionExecute(Sender: TObject);
        Procedure LevelPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        Procedure cxLevelClick(Sender: TObject);
    Private
    { Private declarations }
        PIdLevel: integer;
    Public
    { Public declarations }
    End;
   { ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      ReportParam:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;    }

Var
    fmMain: TfmMain;
    id_sp_report, id_session: Int64;
    IsDesign: Boolean;
    PId_Pcard: integer;


Implementation

Uses dmReportCard, RxMemDS;

Const NameReport = 'UpReportCard';

{$R *.dfm}

Destructor TUpReportCard.Destroy;
Begin
    Inherited Destroy;
End;

Function CreateSprav: TSprav; Stdcall;
Begin
    Result := TUpReportCard.Create;
End;

Constructor TUpReportCard.Create;
Begin
    Inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    PrepareMemoryDatasets;
End;

Procedure TUpReportCard.Show;
Var
    hnd: Integer;
    Print: TfmMain;
Begin

    hnd := Input['DBHandle'];
    If VarIsNull(Input['DesignReport']) Then IsDesign := False
    Else IsDesign := Input['DesignReport'];
    PId_Pcard := Input['ID_pcard'];

    DM := TDM.Create(Nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);
    Print := TfmMain.Create(Application.MainForm, hnd);
    Print.ShowModal;
    Print.Free;
    Dm.Free;
End;

Constructor TfmMain.Create(aOwner: TComponent; HandleDb: Integer);
Var LevelDS: TpFIBDataSet;
Begin
    Inherited Create(aOwner);
    self.Caption := 'Особиста картка';
    LevelDS := TpFIBDataSet.Create(self);
    LevelDS.Database := Dm.DB;
    LevelDS.Transaction := Dm.ReadTransaction;
    LevelDS.SelectSQL.Text := 'SELECT * FROM UP_KER_UTIL_GET_DEF_LEVEL';
    LevelDS.Open;
    If (LevelDS.RecordCount > 0)
        Then Begin
            LevelEdit.Text := LevelDS.FieldByName('LEVEL_NAME').AsString;
            Pidlevel := LevelDS.FieldByName('ID_LEVEL').Value;
        End;
    LevelDS.Close;
    LevelDS.Free;

End;

Procedure TfmMain.cxButtonCloseClick(Sender: TObject);
Begin
    With Dm Do
        Begin
            CardDataSet.Close;
            CardDataSet.Free;
            RegardDataSet.Close;
            RegardDataSet.Free;
            StajDataSet.Close;
            StajDataSet.Free;
            MovingsDataSet.Close;
            MovingsDataSet.Free;
            HolydaysDataSet.Close;
            HolydaysDataSet.Free;
        End;
    Close;
End;

Procedure TfmMain.PrintActionExecute(Sender: TObject);
Begin
    With Dm Do
        Begin
            CardDataSet.Active := False;
            CardDataSet.SQLs.SelectSQL.Text := 'SELECT distinct * FROM ASUP_REPORT_CARD (:ID_PCARD)';
            {регалии}
            RegardDataSet.Active := False;
            RegardDataSet.SQLs.SelectSQL.Text := 'SELECT distinct * FROM  ASUP_REPORT_REGARDS (:ID_PCARD)';
            {стаж}
            StajDataSet.Active := False;
            StajDataSet.SQLs.SelectSQL.Text := 'SELECT distinct * FROM UP_REPORT_STAJ (:ID_PCARD, ' + IntToStr(PIdLevel) + ')';
            {назначения}
            MovingsDataSet.Active := False;
            MovingsDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_REPORT_MOVINGS (:ID_PCARD, ' + IntToStr(PIdLevel) + ')';
            {отпуск}
            HolydaysDataSet.Active := False;
            HolydaysDataSet.SQLs.SelectSQL.Text := 'SELECT distinct * FROM UP_REPORT_HOLYDAYS (:ID_PCARD, ' + IntToStr(PIdLevel) + ')';

            Try
                CardDataSet.ParamByName('id_pcard').Value := PId_Pcard;
                RegardDataSet.ParamByName('id_pcard').Value := PId_Pcard;
                StajDataSet.ParamByName('id_pcard').Value := PId_Pcard;
                MovingsDataSet.ParamByName('id_pcard').Value := PId_Pcard;
                HolydaysDataSet.ParamByName('id_pcard').Value := PId_Pcard;
                CardDataSet.Active := True;
                RegardDataSet.Active := True;
                StajDataSet.Active := True;
                MovingsDataSet.Active := True;
                HolydaysDataSet.Active := True;
            Except
                On E: Exception Do
                    Begin
                        messageBox(0, PChar('Помилка при підготовці звіту!'), 'Помилка!', MB_OK);
                        Exit;
                    End;
            End;

            If CardDataSet.IsEmpty Then
                Begin
                    messageBox(0, PChar('За такими данними співробітників не знайдено'), 'Увага!', MB_OK);
                    Exit;
                End;

            Report.Clear;
            Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Up\' + NameReport + '.fr3', True);
            
            If IsDesign Then
                Report.DesignReport
            Else
                Report.ShowReport;

            CardDataSet.Close;
            RegardDataSet.Close;
            StajDataSet.Close;
            MovingsDataSet.Close;
            HolydaysDataSet.Close;
        End;
End;

Procedure TfmMain.LevelPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Довідник рівнів актуальності';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_SYS_LEVEL';
    Params.Fields := 'LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.FieldsName := 'Порядок,Назва';
    Params.KeyField := 'ID_LEVEL';
    Params.ReturnFields := 'LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.DBHandle := Integer(Dm.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
        Begin
            PIdLevel := output['Id_level'];
            LevelEdit.Text := VarToStr(output['Level_name']);
        End;
End;

Procedure TfmMain.cxLevelClick(Sender: TObject);
Begin
    LevelEdit.Enabled := cxLevel.Checked;
End;

End.

