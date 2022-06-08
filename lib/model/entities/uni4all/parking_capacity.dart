class ParkingCapacity {
  final String data;
  final int p1lotacao;
  final int p3lotacao;
  final int p4lotacao;
  final int p1in;
  final int p1out;
  final int p3in;
  final int p3out;
  final int p4in;
  final int p4out;
  final int p1ocupados;
  final int p3ocupados;
  final int p4ocupados;
  final int p1livres;
  final int p3livres;
  final int p4livres;

  const ParkingCapacity({
    this.data,
    this.p1lotacao,
    this.p3lotacao,
    this.p4lotacao,
    this.p1in,
    this.p1out,
    this.p3in,
    this.p3out,
    this.p4in,
    this.p4out,
    this.p1ocupados,
    this.p3ocupados,
    this.p4ocupados,
    this.p1livres,
    this.p3livres,
    this.p4livres,
  });

  factory ParkingCapacity.fromJson(Map<String, dynamic> json) {
    return ParkingCapacity(
      data: json['data'],
      p1lotacao: json['p1lotacao'],
      p3lotacao: json['p3lotacao'],
      p4lotacao: json['p4lotacao'],
      p1in: json['P1in'],
      p1out: json['P1out'],
      p3in: json['P3in'],
      p3out: json['P3out'],
      p4in: json['P4in'],
      p4out: json['P4out'],
      p1ocupados: json['p1ocupados'],
      p3ocupados: json['p3ocupados'],
      p4ocupados: json['p4ocupados'],
      p1livres: json['p1livres'],
      p3livres: json['p3livres'],
      p4livres: json['p4livres'],
    );
  }
}
