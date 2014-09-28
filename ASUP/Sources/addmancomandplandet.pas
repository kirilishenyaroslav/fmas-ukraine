unit AddManComandPlanDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery;

type
  TAddManComandPlanDetForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MestoEdit: TEdit;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    WriteQuery: TIBQuery;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Mesto2Edit: TEdit;
    Label1: TLabel;
    Org_name: TEdit;
    Label5: TLabel;
    procedure OkButtonClick(Sender: TObject);
    Constructor Create(aOwner : TComponent;
                       aMesto : String;
                       aMesto2: String;
                       aDate_Beg : TDate;
                       aDate_End : TDate;
                       aID_MAN_COMAND_PLAN_DET : Integer;
                       aID_MAN_COMAND_PLAN : Integer;
                       aForm_Type : String = 'PLAN'); reintroduce;
  private
    { Private declarations }
  public
    ID_MAN_COMAND_PLAN : Integer;
    ID_MAN_COMAND_PLAN_DET : Integer;
    Form_Type : String;
  end;

var
  AddManComandPlanDetForm: TAddManComandPlanDetForm;

implementation

uses PersonalCommon, SpCommon;

{$R *.dfm}

Constructor TAddManComandPlanDetForm.Create(aOwner : TComponent;
                                            aMesto : String;
                                            aMesto2: String;
                                            aDate_Beg : TDate;
                                            aDate_End : TDate;
                                            aID_MAN_COMAND_PLAN_DET : Integer;
                                            aID_MAN_COMAND_PLAN : Integer;
                                            aForm_Type : String = 'PLAN');
begin
    inherited Create(aOwner);

    WriteQuery.Transaction := PersonalCommon.WriteTransaction;

    ID_MAN_COMAND_PLAN := aID_MAN_COMAND_PLAN;
    ID_MAN_COMAND_PLAN_DET := aID_MAN_COMAND_PLAN_DET;
    Form_Type := aForm_Type;

    MestoEdit.Text := aMesto;
    Mesto2Edit.Text := aMesto2;
    DateBeg.Date := aDate_Beg;
    DateEnd.Date := aDate_End;

    if ID_MAN_COMAND_PLAN_DET = -1
    then begin
        Caption := Caption + ' (нове)';
    end
    else begin
        Caption := Caption + ' (редагування)';
    end;

end;

procedure TAddManComandPlanDetForm.OkButtonClick(Sender: TObject);
var
    parametr: string;
begin
    parametr := '';
    if (MestoEdit.Text = '')
    then begin
        MessageDlg('Потрібно ввести місто вибуття!',mtError,[mbOk],0);
        MestoEdit.SetFocus;
        Exit;
    end;

    if (Mesto2Edit.Text = '')
    then begin
        MessageDlg('Потрібно ввести місто прибуття!',mtError,[mbOk],0);
        MestoEdit.SetFocus;
        Exit;
    end;

    //Hunter add kod
    if (Org_name.Text = '')
    then begin
        MessageDlg('Потрібно ввести органiзацiю прибуття!',mtError,[mbOk],0);
        Org_name.SetFocus;
        Exit;
    end;
    //end add kod

    try
        if Form_Type = 'PLAN' then
            parametr := ',' + QuotedStr(Org_name.Text);

        WriteQuery.Transaction.StartTransaction;

        WriteQuery.Close;

        //ShowMessage('ID_MAN=' + IntToStr(ID_MAN_COMAND_PLAN) +', DATEBEG='+DateToStr(DATEBEG.Date)+', DATEEND='+DateToStr(DATEEND.Date)+', MESTOEdit='+MESTOEdit.Text+ ', MESTO2Edit=' +MESTO2Edit.Text);
        if ID_MAN_COMAND_PLAN_DET = -1
        then
            WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_' + Form_Type + '_DET_INSERT(' + IntToStr(ID_MAN_COMAND_PLAN) + ','
                                                                                      + QuotedStr(DateToStr(DATEBEG.Date)) + ','
                                                                                      + QuotedStr(DateToStr(DATEEND.Date)) + ','
                                                                                      + QuotedStr(MESTOEdit.Text) + ','
                                                                                      + QuotedStr(MESTO2Edit.Text)+ parametr + ')'
        else
            WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_' + Form_Type + '_DET_UPDATE(' + IntToStr(ID_MAN_COMAND_PLAN_DET) + ','
                                                                                      + IntToStr(ID_MAN_COMAND_PLAN) + ','
                                                                                      + QuotedStr(DateToStr(DATEBEG.Date)) + ','
                                                                                      + QuotedStr(DateToStr(DATEEND.Date)) + ','
                                                                                      + QuotedStr(MESTOEdit.Text) + ','
                                                                                      + QuotedStr(MESTO2Edit.Text) +  parametr +  ')';

        ExecQuery(WriteQuery);

    except on E:Exception
        do begin
                WriteQuery.Transaction.Rollback;
                MessageDlg('При занесенні данних у базу виникла помилка: ' + E.Message ,mtError,[mbOk],0);
                exit;
        end;
    end;

    WriteQuery.Transaction.Commit;

    ModalResult := mrOk;

end;

end.
