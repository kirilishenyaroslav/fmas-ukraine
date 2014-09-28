{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uShowFields;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls;

type
  TfmShowFields = class(TForm)
    ActionList1: TActionList;
    acExit: TAction;
    MemoValues: TMemo;
    procedure acExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShowFields: TfmShowFields;

implementation

{$R *.dfm}

procedure TfmShowFields.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TfmShowFields.FormCreate(Sender: TObject);
begin
 MemoValues.Lines.Clear;
end;

procedure TfmShowFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

end.



