from django.db import models
from django.db import models

# Create your models here.

class Performance(models.Model):
    DistrictID = models.IntegerField()
    District = models.CharField(max_length=40)
    SchoolID = models.IntegerField()
    School = models.CharField(max_length=70)
    AcademicYear = models.IntegerField
    Subject = models.CharField(max_length=25)
    Subgroup = models.CharField(max_length=35)
    GradeLevel = models.CharField(max_length=3)
    ParticipationRate2014to2015 = models.FloatField()
    PercentageMeetsORExceeds2014to2015 = models.FloatField()

    def __str__(self):
        formatted = "{sch} Grade {gr} {yr}"
        return formatted.format(sch=self.School, gr=self.GradeLevel, yr=str(self.AcademicYear))


class School(models.Model):
    SchoolID = models.IntegerField()
    School = models.CharField(max_length=60)
    District = models.CharField(max_length=50)
    DistID = models.IntegerField()

    def __str__(self):
        formatted = "{sch} of {dst}"
        return formatted.format(sch=SchoolID, dst=DistID)

