
{ -$Id: ToDoManCloseUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система <Управление персоналом              }
{       государственного производственного предприятия <Укрпромводчермет>      }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{              Модуль "Модуль закрытия приказов про надання завдання"          }
{         Добавляет/изменяет закрытие приказов про надання завдання            }
{         Ответственный: Кропов Валентин                                       }


unit ToDoManCloseUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, SpComboBox, ComCtrls;

type
    TToDoManCloseForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CloseDate: TDateTimePicker;
        Label7: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        QualityMarkName: TLabel;
        QualityMarkValue: TLabel;
        ComplexMarkButton: TButton;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure ComplexMarkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
        ID_MARK: Integer;
    end;

var
    ToDoManCloseForm: TToDoManCloseForm;

implementation
uses SpCommon, SpFormUnit;
{$R *.dfm}

procedure TToDoManCloseForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TToDoManCloseForm.OkButtonClick(Sender: TObject);
begin
    if (ID_MARK = -1)
        then MessageDlg('Потрібно вибрати оцінку якості!', mtError, [mbOk], 0)
    else ModalResult := mrOk;
end;

procedure TToDoManCloseForm.ComplexMarkButtonClick(Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    temp := TSpForm.Create(Self);
    params := TSpParams.Create;
    params.IdField := 'ID_MARK';
    params.SpFields := 'MARK_NAME, MARK_VALUE';
    params.Title := 'Виберіть оцінку якості';
    params.ColumnNames := 'Назва оцінки, Коефіцієнт якості';
    params.ReadOnly := True;
    params.Table := 'INI_QUALITY_MARK';
    params.SpMode := spmSelect;
    temp.Init(params);
    temp.ShowModal;
    if temp.ModalResult = mrOk then begin
        Id_MARK := temp.ResultQuery['ID_MARK'];
        QualityMarkName.Caption := temp.ResultQuery['MARK_NAME'];
        QualityMarkValue.Caption := FloatToStr(temp.ResultQuery['MARK_VALUE']);
    end;
    temp.free;
end;

procedure TToDoManCloseForm.FormCreate(Sender: TObject);
begin
    ID_MARK := -1;
    CloseDate.DateTime := Date;
    QualityMarkName.Caption := 'Не вибрано';
    QualityMarkValue.Caption := 'Не вибрано';
end;

end.
