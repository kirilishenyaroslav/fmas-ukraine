unit uMatasReportPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FR_View;

type
  TFormReportPreview = class(TForm)
    frPreview: TfrPreview;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReportPreview: TFormReportPreview;

implementation

{$R *.dfm}

procedure TFormReportPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

end.
