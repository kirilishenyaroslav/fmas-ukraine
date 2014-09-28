{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль установки/изменения надбавок на базовый оклад         }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_Salary_Sum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls, RxMemDS, Buttons, SpCommon,
  FieldControl, Mask, CheckEditUnit, FIBDataSet, pFIBDataSet, EditControl,
  U_SPPost_DataModule, cxControls, cxSplitter, ActnList;

type
  TSP_Post_SalSum = class(TForm)
    Panel3: TPanel;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    Panel4: TPanel;
    Label5: TLabel;
    CE_Name: TCheckEdit;
    FC_Name: TFieldControl;
    CheckBox1: TCheckBox;
    ActionList1: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    procedure FormShow(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
  private
    FormControl: TEditControl;
    { Private declarations }
  public
    pps:string;
    DMod:TDMSPPost;
    Add:Boolean;
    id_bs:integer;
    { Public declarations }
  end;

var
  SP_Post_SalSum: TSP_Post_SalSum;

implementation

{$R *.dfm}

uses uCommonSp;

procedure TSP_Post_SalSum.FormShow(Sender: TObject);
begin
  CheckBox1.Checked:=pps='T';
  if not Add then
   begin
     Refresh;
   end;
end;

procedure TSP_Post_SalSum.SbOkClick(Sender: TObject);
begin
  FormControl.Read;

  if not FormControl.CheckFill then
  begin
    ModalResult := 0;
    Exit;
  end;

  {if not TextOk(CE_Name.Text)then
   begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     ModalResult := 0;
     Exit;
   end;}

  if CE_Name.Text='' then CE_Name.Text:=' ';
end;

procedure TSP_Post_SalSum.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Name]);
  FormControl.Prepare(emNew);
  pps:='F';
end;

procedure TSP_Post_SalSum.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
   pps:='T' else
   pps:='F';
end;

procedure TSP_Post_SalSum.CancelActionExecute(Sender: TObject);
begin
    SbCancel.Click;
end;

procedure TSP_Post_SalSum.AcceptActionExecute(Sender: TObject);
begin
    SbOk.Click;
end;

end.
